
import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/signup/signup_controller.dart';
import 'package:hem_capstone_app/controllers/widgets/timer_controller.dart';

class SignUpBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(TimerController());
  }
}