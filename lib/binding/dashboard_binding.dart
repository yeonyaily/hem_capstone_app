import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/controller.dart';


class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.put(SwitchController());
    Get.put(RadioController());
  }
}
