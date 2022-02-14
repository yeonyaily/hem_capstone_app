import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/signup/signup_controller.dart';
import 'package:hem_capstone_app/controllers/widgets/timer_controller.dart';
import 'package:hem_capstone_app/models/user_model.dart';
import 'package:hem_capstone_app/repository/auth_repository.dart';
import 'package:hem_capstone_app/repository/health_repository.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:hem_capstone_app/utils/user/health_util.dart';
import 'package:hem_capstone_app/utils/user/user_util.dart';
import 'package:hem_capstone_app/widgets/custom/custom_dialog/custom_dialog.dart';
import 'package:public_health_model/public_health_model.dart';
import 'package:tilko_plugin/tilko_plugin.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final _userCollection = firebase.collection('users');
  final signup = SignUpController.to;

  UserModel? userModel;

  late Rxn<User?> _user;

  @override
  void onInit() {
    _user = Rxn<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _setInitialView);
    super.onInit();
  }

  _setInitialView(User? user) async {
    await getUserInfo();
    await getHealthData();

    user == null
        ? Get.offAllNamed(Routes.START)
        : Get.offAllNamed(Routes.DASHBOARD);
  }

  Future<void> getUserInfo() async {
    if (auth.currentUser != null) {
      var uid = auth.currentUser!.uid;
      userModel = await AuthRepository().findUserByUid(uid);
      if (userModel == null) {
        DateTime currentPhoneDate = DateTime.now();
        Timestamp myTimeStamp = Timestamp.fromDate(currentPhoneDate);
        userModel = UserModel(
          uid: uid,
          phoneNumber: auth.currentUser!.phoneNumber,
          birth: myTimeStamp,
        );
        _userCollection
            .doc(uid)
            .set(userModel!.toMap())
            .then((value) => print('Set User'))
            .catchError((e) => print(e));
      }
      UserUtil.setUser(userModel!);
    } else {
      return;
    }
  }

  Future<void> getHealthData() async {
    if (auth.currentUser != null) {
      var uid = auth.currentUser!.uid;
      InspectionModel? inspectionModel =
          await HealthRepository().findHealthDataByUid(uid);
      DrugModel? drugModel = await HealthRepository().findMedicalDataByUid(uid);
      HealthUtil.setInspectionData(inspectionModel);
      HealthUtil.setMedicalData(drugModel);
    }
  }

  Future<void> sendOTPNumber() async {
    print(
        '8210 ${signup.phoneNumberController.text.trim().substring(3, 7)} ${signup.phoneNumberController.text.trim().substring(7)}');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+8210" +
          signup.phoneNumberController.text.substring(3, 7) +
          signup.phoneNumberController.text.substring(7),
      verificationCompleted: (phoneAuthCredential) async {
        print("OTP 문자 도착");
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('the provided phone number is not valid');
        } else {
          print(e.code);
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        print('코드 전송완료');
        signup.verificationId = verificationId;
        CustomDialog.showDialog(
          title: '알림',
          content: '인증코드가 전송되었습니다.\n2분 이내에 입력해주세요.',
        );
        signup.isSendAuthNumber.value = true;
        signup.isLoading.value = false;
        TimerController.to.start();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution
        signup.verificationId = verificationId;
      },
      timeout: const Duration(seconds: 120),
    );
  }

  Future<UserCredential> signInWithPhoneNumber() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: signup.verificationId!,
        smsCode: signup.phoneAuthNumberController.text);
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    try {
      if (userCredential.user != null) {
        signup.isLoading.value = false;
        print("인증완료");
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      signup.isLoading.value = false;
      print('인증실패..\n${e.code}');
      CustomDialog.showDialog(
        title: '인증실패',
        content: '올바른 인증번호를 입력해주새요.',
      );
    }
    return userCredential;
  }

  void logout() {
    auth.signOut();
    signup.clear();
    userModel == null;
  }
}
