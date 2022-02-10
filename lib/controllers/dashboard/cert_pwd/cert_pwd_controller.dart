import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CertPwdController extends GetxController {
  static CertPwdController get to => Get.find();

  RxBool isPwd = false.obs;
  RxBool isLoading = false.obs;

  late TextEditingController certPwdController;

  @override
  void onInit() {
    certPwdController = TextEditingController();
    super.onInit();
  }

  void approvePwd() {
    isPwd(true);
  }

  void disapprovePwd() {
    isPwd(false);
  }

  void switchLoading() {
    isLoading(!isLoading.value);
  }
}
