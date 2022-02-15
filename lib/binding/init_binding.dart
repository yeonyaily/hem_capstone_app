import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/controller.dart';


class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CertController());
    Get.put(SignUpController());
    Get.put(AuthController());
  }
}
