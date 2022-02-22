import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/dashboard/home/cert_controller.dart';
import 'package:hem_capstone_app/controllers/dashboard/navigation_controller.dart';
import 'package:hem_capstone_app/screens/dashboard_views/empty_view.dart';
import 'package:hem_capstone_app/screens/dashboard_views/home/home_screen.dart';
import 'package:hem_capstone_app/screens/dashboard_views/mypage/mypage_screen.dart';
import 'package:hem_capstone_app/screens/dashboard_views/physical_check/checkup_screen.dart';
import 'package:hem_capstone_app/screens/dashboard_views/treat_history/treat_history_screen.dart';
import 'package:hem_capstone_app/theme/theme.dart';

class DashBoard extends GetView<NavigationController> {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = controller.item;
    final _controller = Get.put(CertController());
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeScreen(),
              !_controller.isCertOn.value ? EmptyPage() : TreatHistoryView(),
              !_controller.isCertOn.value ? EmptyPage() : HealthCheckUpScreen(),
              !_controller.isCertOn.value ? EmptyPage() : MypageView(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                controller.item.length,
                (index) => InkWell(
                  onTap: () => controller.changeTabIndex(index),
                  child: Container(
                    width: Get.width / 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item[index]['icon'],
                          color: controller.tabIndex == index
                            ? Theme.of(context).primaryColor
                            : basicBlack,
                        ),
                        Text(
                          item[index]['text'],
                          style: TextStyle(
                            color: controller.tabIndex == index
                              ? Theme.of(context).primaryColor
                              : basicBlack,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ),
        ),
      )
    );
  }
}
