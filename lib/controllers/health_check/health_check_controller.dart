import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:hem_capstone_app/utils/user/health_util.dart';
import 'package:public_health_model/inspections_model.dart';

class HealthCheckController extends GetxController {
  double get headingRowHeight => 32;
  
  InspectionModel? inspectionModel = HealthUtil.getInspectionData();

  final dummy = [
    {
      'date': '2018-01-01',
      'location': '의료법인인봉의료재단뉴고려병원',
      'result': IconButton(
        onPressed: () => Get.toNamed(Routes.CHECKUPDETAIL,
            arguments: HealthCheckController().dummy[0]),
        icon: Image.asset(
          'assets/phi/result.png',
          width: 20,
          height: 20,
        ),
      ),
    },
    {
      'date': '2017-01-01',
      'location': '의료법인인봉의료재단뉴고려병원',
      'result': IconButton(
        onPressed: () => Get.toNamed(Routes.CHECKUPDETAIL,
            arguments: HealthCheckController().dummy[1]),
        icon: Image.asset(
          'assets/phi/result.png',
          width: 20,
          height: 20,
        ),
      ),
    },
    {
      'date': '2016-01-01',
      'location': '의료법인인봉의료재단뉴고려병원',
      'result': IconButton(
        onPressed: () => Get.toNamed(Routes.CHECKUPDETAIL,
            arguments: HealthCheckController().dummy[2]),
        icon: Image.asset(
          'assets/phi/result.png',
          width: 20,
          height: 20,
        ),
      ),
    },
  ];

  final dataColumn = [
    {
      'width': 97.0,
      'text': '검진일자',
    },
    {
      'width': 175.0,
      'text': '검진 장소',
    },
    {
      'width': 54.0,
      'text': '결과',
    },
  ];

  final healthRecordDummy = [
    {'title': '계측검사', 'subTitle': '비만과 관련된 체중이나 신장과 같은 기본 정보를 알려드립니다'},
    {
      'title': '요검사',
      'subTitle': '소변 내의 박테리아나\n대사 산물을 검출합니다',
    },
    {
      'title': '혈액검사',
      'subTitle': '혈액에서 의학적 정보를 얻어 건강상태나 질병을 추적합니다',
    },
    {
      'title': '영상검사',
      'subTitle': '영상 기술을 통하여\n폐와 관련된 정보를 제공합니다',
    },
    {
      'title': '골다공증',
      'subTitle': '골다공증에 대한\n검사결과를 나타냅니다',
    }
  ];

  final inspectionData = HealthUtil.getInspectionData();
}
