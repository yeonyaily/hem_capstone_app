import 'package:get/get.dart';
import 'package:hem_capstone_app/binding/dashboard_binding.dart';
import 'package:hem_capstone_app/binding/init_binding.dart';
import 'package:hem_capstone_app/binding/signup_binding.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/screens/dashboard_views/dashboard.dart';
import 'package:hem_capstone_app/screens/dashboard_views/home/home.dart';
import 'package:hem_capstone_app/screens/dashboard_views/mypage/mypage_screen.dart';
import 'package:hem_capstone_app/screens/dashboard_views/physical_check/checkup_detail_screen.dart';
import 'package:hem_capstone_app/screens/dashboard_views/physical_check/checkup_gubun_screen.dart';
import 'package:hem_capstone_app/screens/dashboard_views/treat_history/drug_detail_screen.dart';
import 'package:hem_capstone_app/screens/dashboard_views/treat_history/treat_detail_screen.dart';
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
  static const ENTERBIRTH = Routes.ENTERBIRTH;
  static const ENTERPWD = Routes.ENTERPWD;
  static const TREATDETAIL = Routes.TREATDETAIL;
  static const DRUGDETAIL = Routes.DRUGDETAIL;
  static const CHECKUPDETAIL = Routes.CHECKUPDETAIL;
  static const CHECKUPGUBUN = Routes.CHECKUPGUBUN;
  static const MYPAGE = Routes.MYPAGE;

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
      page: () => CertCopyScreen(),
    ),
    GetPage(
      name: CERTON,
      page: () => CertOnPage(),
    ),
    GetPage(
      name: HELP,
      page: () => const HelpScreen(),
    ),
    GetPage(
      name: ENTERBIRTH,
      page: () => EnterBirthPage(),
      binding: BindingsBuilder(() {
        Get.put(CertController());
      }),
    ),
    GetPage(
      name: ENTERPWD,
      page: () => EnterCertPwdPage(),
      binding: BindingsBuilder(() {
        Get.put(CertController());
      }),
    ),
    GetPage(
      name: TREATDETAIL,
      page: () => const TreatDetailScreen(),
    ),
    GetPage(
      name: DRUGDETAIL,
      page: () => const DrugDetailScreen(),
    ),
    GetPage(
      name: CHECKUPDETAIL,
      page: () => const CheckUpDetailScreen(),
      // binding: BindingsBuilder((){
      //   Get.put(HealthCheckController());
      // })
    ),
    GetPage(
      name: CHECKUPGUBUN,
      page: ()=> const CheckUpGobunScreen(),
      // binding: BindingsBuilder((){
      //   Get.put(HealthCheckController());
      // })
    ),
    GetPage(
      name: MYPAGE,
      page: ()=> const MypageView(),
    )
  ];
}
