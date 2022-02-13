import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/screens/dashboard_views/mypage/mypage_screen.dart';
import 'package:hem_capstone_app/utils/user/health_util.dart';
import 'package:public_health_model/public_health_model.dart';

class CheckupView extends StatelessWidget {
  const CheckupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DrugModel? drugModel = HealthUtil.getMedicalData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        actions: [
          IconButton(onPressed: ()=> Get.to(()=> MypageView()), icon: Icon(Icons.ac_unit)),
        ],
      ),
      body: Center(
        child: Text(
          drugModel == null ? '아직 초기화 X' : drugModel.status,
        ),
      ),
    );
  }
}
