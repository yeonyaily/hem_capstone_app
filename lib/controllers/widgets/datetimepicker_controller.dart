import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hem_capstone_app/constant/constant.dart';

class DatetimePickerController extends GetxController {
  static DatetimePickerController get to => Get.find();

  DateTime selectedDate = DateTime.now();
  final _userCollection = FirebaseFirestore.instance.collection('users');
  var uid = auth.currentUser!.uid;

  void onDateTimeChanged(DateTime value) {
    if (value != selectedDate) selectedDate = value;
    update();
  }

  void addBirthInfo() {
    _userCollection.doc(uid).update({'birth': selectedDate});
  }

  @override
  void onInit() {
    _userCollection.doc(uid).update({'birth': selectedDate});
    super.onInit();
  }
}
