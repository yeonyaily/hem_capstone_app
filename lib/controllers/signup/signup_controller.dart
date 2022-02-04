import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  static SignUpController get to => Get.find();

  RxBool isLoading = false.obs;

  // phone Number
  RxBool isPhoneNumber = false.obs;
  RxBool isPhoneAuthNumber = false.obs;

  RxBool isSendAuthNumber = false.obs;
  
  RxBool isPhoneNumberVaild = false.obs;

  String? verificationId;

  late FocusNode focusNode;
   
  // TextEditingController
  late TextEditingController phoneNumberController;
  late TextEditingController phoneAuthNumberController;

  @override
  void onInit() {
    focusNode = FocusNode();
    phoneNumberController = TextEditingController();
    phoneAuthNumberController = TextEditingController();
    super.onInit();
  }

  void requestFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
    update();
  }

  clear(){
    phoneAuthNumberController.clear();
    phoneNumberController.clear();
    isSendAuthNumber.value = false;
    isPhoneNumberVaild.value = false;
    isPhoneNumber.value = false;
    isPhoneAuthNumber.value = false;
  }
}