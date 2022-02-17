import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/models/user_model.dart';
import 'package:hem_capstone_app/repository/repository.dart';
import 'package:hem_capstone_app/utils/user/util.dart';

class DatetimePickerController extends GetxController {
  static DatetimePickerController get to => Get.find();

  DateTime selectedDate = DateTime(2000,01,01);
  final _userCollection = FirebaseFirestore.instance.collection('users');
  var uid = auth.currentUser!.uid;

  void onDateTimeChanged(DateTime value) {
    if (value != selectedDate) selectedDate = value;
    update();
  }

  void addBirthInfo() async {
    Timestamp birth = Timestamp.fromDate(selectedDate);
    _userCollection.doc(uid).update({'birth': birth});
    UserModel? userModel = await AuthRepository().findUserByUid(AuthRepository().userUid);
    if(userModel != null) UserUtil.setUser(userModel); 
  }

  @override
  void onInit() {
    super.onInit();
  }
}
