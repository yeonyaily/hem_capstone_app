import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  int tabIndex = 0;

  final List<Map<String, dynamic>> _item = [
    {
      'icon': Icons.home_rounded,
      'text': '홈',
    },
    {
      'icon': Icons.grid_view,
      'text': '진료 내역',
    },
    {
      'icon': Icons.settings_rounded,
      'text': '약먹자',
    },
    {
      'icon': Icons.home_rounded,
      'text': '건강검진',
    },
    {
      'icon': Icons.home_rounded,
      'text': '마이페이지',
    },
  ];

  List<Map<String, dynamic>> get item => _item;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
