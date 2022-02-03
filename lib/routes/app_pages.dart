import 'package:get/get.dart';
import 'package:hem_capstone_app/binding/init_binding.dart';

import '../start.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const START = Routes.START;

  static final routes = [
    GetPage(
      name: START,
      page: () => const StartView(),
      binding: InitBinding(),
    ),
  ];
}
