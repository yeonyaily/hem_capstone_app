import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:logger/logger.dart';
import 'package:tilko_plugin/tilko_plugin.dart';

class CertCopyController extends GetxController {
  static CertCopyController get to => Get.find();

  RxBool isLoading = false.obs;
  RxString frontKey = "    ".obs;
  RxString backKey = "    ".obs;
  var certMap = Map<String, List<String>>();

  Timer? _timer;
  final _time = 0.obs;
  final _sec = 1.obs;

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
    certMap = val;
    update();
  }

  @override
  void onInit() {
    // start();

    getKey();

    // ever(_time, (_) => getCertificates());

    super.onInit();
  }

  // void start() {
  //   _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
  //     _sec.value = _time.value ~/ 60;
  //     _time.value++;
  //   });
  // }
}

// final logger = Logger();

  // RxString frontKey = "    ".obs;
  // RxString backKey = "    ".obs;
  // var certMap = RxMap<String, List<String>>({});
  // RxInt certLength = 0.obs;

  // Timer? _timer;
  // final _time = 0.obs;
  // final _sec = 1.obs;

  // Future<void> getKey() async {
  //   String key;
  //   try {
  //     key = await TilkoPlugin.getKey();
  //     // frontKey.value = key.substring(0, 4);
  //     // backKey.value = key.substring(4, 8);
  //     frontKey(key.substring(0, 4));
  //     backKey(key.substring(4, 8));
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> getCertificates() async {
  //   logger.d('getCertificate 시작!...');
  //   Map<String, List<String>> val = await TilkoPlugin.getCertificate();
  //   certMap(val);

  //   // logger.d(val);
  //   // logger.d(certMap);
  //   // logger.d(certMap.length);
  //   // certLength(certMap.length);
  //   // logger.d(certLength);
  //   // logger.d(certMap.values.isEmpty);
  //   // logger.d('value len:' + certMap.values.length.toString());
  //   // logger.d(certMap.keys.isEmpty);
  //   // logger.d('key len:' + certMap.keys.length.toString());
  //   // logger.d(certMap['name']?.isEmpty);
  //   // logger.d(certMap['valid']?.isEmpty);
  //   // logger.d(certMap['file']?.isEmpty);
  //   // logger.d('certmap key: ' + certMap.keys.toString());
  //   // logger.d('certmap value: ' + certMap.values.toString());
  //   // logger.d('certmap: ' + certMap.toString());
  //   // certMap.values.isEmpty
  //   //     ? logger.d('it is empty')
  //   //     : logger.d('certMap values length is...' +
  //   //         certMap.values.first.length.toString());
  //   // for (int i = 0; i < certMap.values.length; i++) {
  //   //   if (certMap['name']![i].isNotEmpty) logger.d(certMap['name']![i]);
  //   // }
  // }

  // @override
  // void onClose() {
  //   _timer!.cancel();
  //   logger.d('controller 제거');
  //   super.onClose();
  // }

  // @override
  // void onInit() {
  //   getKey();
  //   getCertificates();

  //   // start();

  //   // setNextView(certMap);

  //   // ever(_time, (_) {
  //   //   getCertificates();
  //   //   logger.d('공동인증서 불러오기 getCertificates 실행!');
  //   //   logger.d(certMap.values);
  //   //   _setNextView(certMap);
  //   // });

  //   super.onInit();
  // }

  // setNextView(RxMap<String, List<String>> certMap) {
  //   // certMap['name']!.isEmpty ? certNotFound() : certDetected();
  //   certMap.values.isEmpty ? certNotFound() : certDetected();
  // }

  // void start() {
  //   _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
  //     _sec.value = _time.value ~/ 60;
  //     _time.value++;
  //   });
  // }

  // void certNotFound() {
  //   logger.d('공동인증서가 비어있습니다!');
  //   // getKey();
  // }

  // void certDetected() {
  //   logger.d('공동인증서가 인식되었습니다');
  //   Get.toNamed(Routes.CERTON);
  // }