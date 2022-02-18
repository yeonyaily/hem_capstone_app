import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/repository/auth_repository.dart';
import 'package:hem_capstone_app/utils/user/health_util.dart';
import 'package:hem_capstone_app/widgets/custom/custom_dialog/custom_dialog.dart';
import 'package:logger/logger.dart';
import 'package:public_health_model/public_health_model.dart';
import 'package:tilko_plugin/tilko_plugin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CertPwdController extends GetxController {
  static CertPwdController get to => Get.find();

  InspectionModel? inspectionModel;
  DrugModel? drugModel;

  RxBool isPwd = false.obs;
  RxBool isLoading = false.obs;

  late TextEditingController certPwdController;

  @override
  void onInit() {
    certPwdController = TextEditingController();
    super.onInit();
  }

  void approvePwd() {
    isPwd(true);
  }

  void disapprovePwd() {
    isPwd(false);
  }

  void switchLoading() {
    isLoading(!isLoading.value);
  }

  Future<void> callTestApi() async {
    final String url = 'https://my.api.mockaroo.com/capstone_my_drug.json?key=cdedf730';
    final logger = Logger();

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      logger.d(body);

      drugModel = DrugModel.fromJson(body);
      String uid = AuthRepository().userUid;

      FirebaseFirestore.instance
        .collection('medicalData')
        .doc(uid)
        .set(
          drugModel!.toMap(),
        )
        .then((value) => print('Add medical data'))
        .catchError((e) => print(e));

      HealthUtil.setMedicalData(drugModel);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<void> callHealthApi(String apiKey, String filePath, String certPass) async {
    try {
      Map<String, dynamic> healthData = await TilkoPlugin.callHealthCheckInfo(apiKey, filePath, certPass);
      // Map<String, dynamic> medicalData = await TilkoPlugin.callMedicalTreatment(apiKey, filePath, certPass);
      inspectionModel = InspectionModel.fromJson(healthData);
      // drugModel = DrugModel.fromJson(medicalData);

      String uid = AuthRepository().userUid;

      FirebaseFirestore.instance
        .collection('healthData')
        .doc(uid)
        .set(
          inspectionModel!.toMap(),
        )
        .then((value) => print('Add health data'))
        .catchError((e) => print(e));

      // FirebaseFirestore.instance
      //   .collection('medicalData')
      //   .doc(uid)
      //   .set(
      //     drugModel!.toMap(),
      //   )
      //   .then((value) => print('Add medical data'))
      //   .catchError((e) => print(e));

      HealthUtil.setInspectionData(inspectionModel);
      // HealthUtil.setMedicalData(drugModel);
    } catch (e) {
      CustomDialog.showDialog(
        title: 'Error',
        content: '$e',
      );
    }
  }
}
