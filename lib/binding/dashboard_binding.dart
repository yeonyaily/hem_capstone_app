import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/dashboard/navigation_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController());
    Get.put(NavigationController());
  }
}
