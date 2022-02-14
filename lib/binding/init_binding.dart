import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/controller.dart';


class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(AuthController());
    Get.put(CertController());
  }
}
