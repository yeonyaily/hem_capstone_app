
import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/controller.dart';

class SignUpBinding extends Bindings{

  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(TimerController());
  }
}