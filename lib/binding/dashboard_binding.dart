import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/dashboard/navigation_controller.dart';
import 'package:hem_capstone_app/controllers/widgets/radio_controller.dart';
import 'package:hem_capstone_app/controllers/widgets/switch_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController());
    Get.put(NavigationController());
    Get.put(SwitchController());
    Get.put(RadioController());
  }
}
