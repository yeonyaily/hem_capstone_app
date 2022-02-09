import 'package:get/instance_manager.dart';
import 'package:hem_capstone_app/controllers/dashboard/cert_copy/cert_copy_controller.dart';
import 'package:hem_capstone_app/controllers/dashboard/cert_pwd/cert_pwd_controller.dart';
import 'package:hem_capstone_app/controllers/widgets/datetimepicker_controller.dart';

class PersonalInfoBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DatetimePickerController());
    Get.put(CertPwdController());
  }
}
