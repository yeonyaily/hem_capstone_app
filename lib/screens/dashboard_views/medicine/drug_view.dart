import 'package:flutter/material.dart';
import 'package:hem_capstone_app/utils/user/util.dart';
import 'package:public_health_model/public_health_model.dart';

class DrugView extends StatelessWidget {
  const DrugView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DrugModel? drugModel = HealthUtil.getMedicalData();
    return Center(
      child: Text(
        drugModel == null ? '아직 초기화 X' : drugModel.status,
      ),
    );
  }
}
