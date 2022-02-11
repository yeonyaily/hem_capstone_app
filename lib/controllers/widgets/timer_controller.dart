import 'package:get/get.dart';

import 'dart:async';

class TimerController extends GetxController {

  static TimerController get to => Get.find();

  Timer? _timer;
  final _time = 119.obs;
  final _sec = 1.obs;
  final isTimeOut = false.obs;
  final _isPlaying = false.obs;

  RxInt get time => _time;
  RxInt get sec => _sec;

  @override
  void onClose() {
    _timer == null ? null : _timer!.cancel();
    print('controller 제거');
    super.onClose();
  }

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _sec.value = _time.value ~/ 60;
      _time.value--;
      if (_time.value == 0) {
        isTimeOut.toggle();
        pause();
      }
    });
  }

  void pause() {
    _timer!.cancel();
  }

  void reset() {
    print(_time.value);
    _timer!.cancel();
    _time.value != 0 ? null : isTimeOut.value = false;
    // _time.value = 299;
    _time.value = 119;
    _sec.value = 1;
  }
}
