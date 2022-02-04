import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/auth/auth_controller.dart';
import 'package:hem_capstone_app/controllers/signup/signup_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(AuthController());
  }
}
