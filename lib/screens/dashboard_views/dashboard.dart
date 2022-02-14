import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/dashboard/navigation_controller.dart';
import 'package:hem_capstone_app/screens/dashboard_views/home/home_screen.dart';
import 'package:hem_capstone_app/screens/dashboard_views/physical_check/checkup_screen.dart';
import 'package:hem_capstone_app/screens/dashboard_views/treat_history/treat_history_screen.dart';
import 'package:hem_capstone_app/theme/theme.dart';

class DashBoard extends GetView<NavigationController> {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = controller.item;
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (_) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeScreen(),
              TreatHistoryView(),
              CheckupView(),
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
              3,
              (index) => InkWell(
                onTap: () => _.changeTabIndex(index),
                child: Container(
                  width: Get.width / 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item[index]['icon'],
                        color: _.tabIndex == index
                            ? Theme.of(context).primaryColor
                            : basicBlack,
                      ),
                      Text(
                        item[index]['text'],
                        style: TextStyle(
                          color: _.tabIndex == index
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
