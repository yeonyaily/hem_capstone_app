import 'package:get/get.dart';
import 'package:hem_capstone_app/binding/cert_copy_binding.dart';
import 'package:hem_capstone_app/binding/dashboard_binding.dart';
import 'package:hem_capstone_app/binding/init_binding.dart';
import 'package:hem_capstone_app/binding/signup_binding.dart';
import 'package:hem_capstone_app/screens/dashboard_views/dashboard.dart';
import 'package:hem_capstone_app/screens/dashboard_views/home/cert_copy.dart';
import 'package:hem_capstone_app/screens/dashboard_views/home/cert_on_page.dart';
import 'package:hem_capstone_app/screens/dashboard_views/home/personal_info.dart';
import 'package:hem_capstone_app/screens/login/help_screen.dart';
import 'package:hem_capstone_app/screens/login/sign_up_screen.dart';
import 'package:hem_capstone_app/start.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const START = Routes.START;
  static const DASHBOARD = Routes.DASHBOARD;
  static const SIGNUP = Routes.SIGNUP;
  static const CERTCOPY = Routes.CERTCOPY;
  static const CERTON = Routes.CERTON;
  static const HELP = Routes.HELP;
  static const PERSONINFO = Routes.PERSONINFO;

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
    GetPage(
      name: CERTCOPY,
      page: () => CertCopyPage(),
      binding: CertCopyBinding(),
    ),
    GetPage(
      name: CERTON,
      page: () => CertOnPage(),
      binding: CertCopyBinding(),
    ),
    GetPage(
      name: HELP,
      page: () => const HelpScreen(),
    ),
    GetPage(
      name: PERSONINFO,
      page: () => PersonalInfoPage(),
    ),
  ];
}
