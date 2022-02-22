import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.find();

  RxInt tabIndex = 0.obs;

  final RxList<Map<String, dynamic>> _item = [
    {
      'icon': Icons.home_rounded,
      'text': '홈',
    },
    {
      'icon': Icons.history,
      'text': '진료 내역',
    },
    {
      'icon': Icons.checklist,
      'text': '건강검진',
    },
    {
      'icon': Icons.person,
      'text': '마이페이지',
    }
  ].obs;

  final List<Map<String, dynamic>> tabBaritem = [
    {
      'text': '병원',
    },
    {
      'text': '약국',
    },
  ];

  List<Map<String, dynamic>> get item => _item;

  void changeTabIndex(int index) {
    tabIndex(index);
    // update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
