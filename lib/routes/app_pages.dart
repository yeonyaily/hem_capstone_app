import 'package:get/get.dart';
import 'package:hem_capstone_app/binding/dashboard_binding.dart';
import 'package:hem_capstone_app/binding/init_binding.dart';
import 'package:hem_capstone_app/binding/signup_binding.dart';
import 'package:hem_capstone_app/screens/dashboard_views/dashboard.dart';
import 'package:hem_capstone_app/screens/login/sign_up_screen.dart';
import 'package:hem_capstone_app/start.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const START = Routes.START;
  static const DASHBOARD = Routes.DASHBOARD;
  static const SIGNUP = Routes.SIGNUP;

  static final routes = [
    GetPage(
      name: START,
      page: () => const Start(),
      binding: InitBinding(),
    ),
    GetPage(
      name: DASHBOARD,
      page: () => const DashBoard(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: SIGNUP,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
  ];
}
