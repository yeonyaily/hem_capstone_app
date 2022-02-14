import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/repository/auth_repository.dart';
import 'package:hem_capstone_app/utils/user/health_util.dart';
import 'package:hem_capstone_app/widgets/custom/custom_dialog/custom_dialog.dart';
import 'package:public_health_model/public_health_model.dart';
import 'package:tilko_plugin/tilko_plugin.dart';

class CertController extends GetxController {
  static CertController get to => Get.find();

  late TextEditingController certPwdController;

  final isLoading = false.obs;
  final isPwd = false.obs;

  final frontKey = "    ".obs;
  final backKey = "    ".obs;

  var certMap = Map<String, List<dynamic>>();

  InspectionModel? inspectionModel;
  DrugModel? drugModel;

  @override
  void onInit() async {
    await getKey();
    await getCertificates();
    certPwdController = TextEditingController();
    super.onInit();
  }

  Future<void> getKey() async {
    String key;
    try {
      key = await TilkoPlugin.getKey();
      frontKey(key.substring(0, 4));
      backKey(key.substring(4, 8));
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCertificates() async {
    Map<String, List<String>> val = await TilkoPlugin.getCertificate();
    certMap = val;
    update();
  }

  Future<void> callHealthApi(
      String apiKey, String filePath, String certPass) async {
    isLoading.toggle();
    try {
      // Map<String, dynamic> healthData = await TilkoPlugin.callHealthCheckInfo(apiKey, filePath, certPass);
      Map<String, dynamic> medicalData =
          await TilkoPlugin.callMedicalTreatment(apiKey, filePath, certPass);
      // inspectionModel = InspectionModel.fromJson(healthData);
      drugModel = DrugModel.fromJson(medicalData);

      String uid = AuthRepository().userUid;

      // FirebaseFirestore.instance.collection('healthData').doc(uid).set(
      //   inspectionModel!.toMap(),
      // )
      // .then((value) => print('Add health data'))
      // .catchError((e)=> print(e));

      firebase
          .collection('medicalData')
          .doc(uid)
          .set(
            drugModel!.toMap(),
          )
          .then((value) => print('Add medical data'))
          .catchError((e) => print(e));

      // HealthUtil.setInspectionData(inspectionModel);
      HealthUtil.setMedicalData(drugModel);
    } catch (e) {
      CustomDialog.showDialog(
        title: 'Error',
        content: '$e',
      );
    } finally {
      isLoading.toggle();
    }
  }

  // Future<void> callTestApi() async {
  //    final String url = 'https://my.api.mockaroo.com/capstone_my_drug.json?key=cdedf730';
  //    final logger = Logger();

  //   final response = await http.get(Uri.parse(url));

  //   if(response.statusCode == 200){
  //     Map<String,dynamic> body = json.decode(response.body);
  //     logger.d(body);

  //     drugModel = DrugModel.fromJson(body);
  //     String uid = AuthRepository().userUid;

  //     firebase.collection('medicalData').doc(uid).set(
  //       drugModel!.toMap(),
  //     )
  //     .then((value) => print('Add medical data'))
  //     .catchError((e)=> print(e));

  //     HealthUtil.setMedicalData(drugModel);
  //   } else {
  //     throw Exception('Failed to load post');
  //   }
  // }
}
