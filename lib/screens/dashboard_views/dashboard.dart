import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/dashboard/navigation_controller.dart';
import 'package:hem_capstone_app/screens/dashboard_views/home/home_view.dart';
import 'package:hem_capstone_app/screens/dashboard_views/physical_check/checkup_view.dart';
import 'package:hem_capstone_app/screens/dashboard_views/treat_history/treat_history_view.dart';

class DashBoard extends GetView<NavigationController> {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = controller.item;
    final width = Get.width;
    final theme = Theme.of(context);
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (_) => Scaffold(
        // backgroundColor:
        //     _.tabIndex == 1 ? const Color(0xff38393A) : Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeView(),
              TreatHistoryView(),
              CheckupView(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 84,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black12,
                width: 2,
              ),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
            // borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(3,
              (index) => InkWell(
                onTap: () => _.changeTabIndex(index),
                child: Container(
                  width: Get.width / 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item[index]['icon'],
                        color: _.tabIndex == index
                            ? Colors.black
                            : Color(0xff898a8d),
                      ),
                      Text(
                        item[index]['text'],
                        style: TextStyle(
                          color: _.tabIndex == index
                              ? Colors.black
                              : Color(0xff898a8d),
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
