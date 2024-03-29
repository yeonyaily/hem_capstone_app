import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/models/user_model.dart';
import 'package:hem_capstone_app/repository/auth_repository.dart';
import 'package:hem_capstone_app/utils/user/util.dart';
import 'package:hem_capstone_app/widgets/custom/custom_dialog/custom_dialog.dart';
import 'package:logger/logger.dart';
import 'package:public_health_model/public_health_model.dart';
import 'package:tilko_plugin/tilko_plugin.dart';

class CertController extends GetxController {
  static CertController get to => Get.find();

  late TextEditingController certPwdController;
  late TextEditingController identityHeadNumController;
  late TextEditingController identityBackNumController;
  String identityNum = '';

  final isLoading = false.obs;
  final isPwd = false.obs;

  final frontKey = "    ".obs;
  final backKey = "    ".obs;

  var certMap = Map<String, List<dynamic>>();
  var certLength = 0;

  RxBool isCertOn = false.obs;
  final logger = Logger();

  InspectionModel? inspectionModel;
  DrugModel? drugModel;

  @override
  void onInit() async {
    detectCert();

    getKey();
    // await getCertificates();
    certPwdController = TextEditingController();
    identityHeadNumController = TextEditingController();
    identityBackNumController = TextEditingController();

    super.onInit();
  }

  Future<void> getKey() async {
    String key;
    try {
      key = await TilkoPlugin.getKey();
      frontKey.value = key.substring(0, 4);
      backKey.value = key.substring(4, 8);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCertificates() async {
    Map<String, List<String>> val = await TilkoPlugin.getCertificate();
    UserModel? userModel;
    certMap = val;
    certLength = certMap.values.first.length;
    if (certLength != 0) {
      FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update({
          'certOnOff': true,
          'name': certMap['name']![0].trim(),
          'validDate': certMap['valid']![0],
        }).then((value) async {
          userModel = await AuthRepository().findUserByUid(AuthRepository().userUid);
          if (userModel != null) {
            UserUtil.setUser(userModel!);
            print('⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿${userModel!.name}⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿');
            print('⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿${userModel!.validDate}⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿');
          }
          print('set User');
        }).catchError((e) => print('⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿${e}⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿'));
    }
    update();
  }

  Future<void> callHealthApi(String apiKey, String filePath, String certPass) async {
    isLoading.toggle();
    try {
      Map<String, dynamic> healthData = await TilkoPlugin.callHealthCheckInfo(apiKey, filePath, certPass);
      Map<String, dynamic> medicalData = await TilkoPlugin.callMedicalTreatment(apiKey, filePath, certPass);
      inspectionModel = InspectionModel.fromJson(healthData);
      drugModel = DrugModel.fromJson(medicalData);

      String uid = AuthRepository().userUid;

      firebase
        .collection('healthData')
        .doc(uid)
        .set(
          inspectionModel!.toMap(),
        )
        .then((value) => print('Add health data'))
        .catchError((e) => print(e));

      firebase
        .collection('medicalData')
        .doc(uid)
        .set(
          drugModel!.toMap(),
        )
        .then((value) => print('Add medical data'))
        .catchError((e) => print(e));

      HealthUtil.setInspectionData(inspectionModel);
      HealthUtil.setMedicalData(drugModel);

    } catch (e) {
      CustomDialog.showDialog(
        title: 'Error',
        content: '$e',
      );
    }
  }

  Future<void> certRegister(String apiKey, String filePath, String identityNum,
      String certPass) async {
    await TilkoPlugin.callCertRegister(apiKey, filePath, identityNum, certPass)
        .then((value) {
      print('국민건강보험공단 공동인증서 등록 완료');
    });
  }

  void detectCert() {
    if (auth.currentUser != null) {
      FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) isCertOn(documentSnapshot['certOnOff']);
        logger.d(documentSnapshot['certOnOff']);
        logger.d(isCertOn);
      });
    }
  }

  // Future<void> callTestApi() async {
  //    final String url = 'https://my.api.mockaroo.com/capstone_my_drug.json?key=cdedf730';
  //    final logger = Logger();

  //   final response = await http.get(Uri.parse(url));

  //   if(response.statusCode == 200){
  //     Map<String,dynamic> body = json.decode(response.body);
  //     logger.d(body);

  //     drugModel = DrugModel.fromJson(body);
  //     String uid = AuthRepository().userUid;

  //     firebase.collection('medicalData').doc(uid).set(
  //       drugModel!.toMap(),
  //     )
  //     .then((value) => print('Add medical data'))
  //     .catchError((e)=> print(e));

  //     HealthUtil.setMedicalData(drugModel);
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }
}
