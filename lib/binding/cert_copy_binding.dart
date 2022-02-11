import 'package:get/instance_manager.dart';
import 'package:hem_capstone_app/controllers/dashboard/cert_copy/cert_copy_controller.dart';

class CertCopyBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CertCopyController());
    // Get.lazyPut(() => CertCopyController());
  }
}
