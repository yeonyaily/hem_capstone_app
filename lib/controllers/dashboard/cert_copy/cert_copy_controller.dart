import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:tilko_plugin/tilko_plugin.dart';

class CertCopyController extends GetxController {
  RxString frontKey = "    ".obs;
  RxString backKey = "    ".obs;
  var certMap = RxMap<String, List<String>>({});
  RxInt certLength = 0.obs;

  Future<void> getKey() async {
    String key;
    try {
      key = await TilkoPlugin.getKey();
      // frontKey.value = key.substring(0, 4);
      // backKey.value = key.substring(4, 8);
      frontKey(key.substring(0, 4));
      backKey(key.substring(4, 8));
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCertificates() async {
    Map<String, List<String>> val = await TilkoPlugin.getCertificate();
    certMap(val);
    certLength(certMap.length);
  }

  @override
  void onInit() {
    getKey();
    getCertificates();
    ever(certLength, (_) => _setNextView(certLength));
    super.onInit();
  }

  _setNextView(RxInt certLength) {
    certLength == 0
        ? print('Impossibble is nothing')
        : Get.toNamed(Routes.CERTON);
  }
}
