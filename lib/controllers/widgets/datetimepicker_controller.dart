import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';

class DatetimePickerController extends GetxController {
  static DatetimePickerController get to => Get.find();

  DateTime selectedDate = DateTime(2000,01,01);
  final _userCollection = FirebaseFirestore.instance.collection('users');
  var uid = auth.currentUser!.uid;

  void onDateTimeChanged(DateTime value) {
    if (value != selectedDate) selectedDate = value;
    update();
  }

  void addBirthInfo() {
    Timestamp birth = Timestamp.fromDate(selectedDate);
    _userCollection.doc(uid).update({'birth': birth});
  }

  @override
  void onInit() {
    _userCollection.doc(uid).update({'birth': selectedDate});
    super.onInit();
  }
}
