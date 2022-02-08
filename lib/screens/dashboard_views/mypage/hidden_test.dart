import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/models/drug_model.dart';
import 'package:hem_capstone_app/models/health_model.dart';
import 'package:hem_capstone_app/widgets/custom/custom_dialog/custom_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logger/logger.dart';

class HiddenTestMode extends StatelessWidget {
  const HiddenTestMode({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('숨겨진 연수의 테스트 공간'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: ()=> Get.to(()=> ModelTestingScreen()),
                child: const Text('모델 테스팅'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModelTestingScreen extends StatefulWidget {
  const ModelTestingScreen({ Key? key }) : super(key: key);

  @override
  State<ModelTestingScreen> createState() => _ModelTestingScreenState();
}

class _ModelTestingScreenState extends State<ModelTestingScreen> {

  // Future<HelathModel>? healthModel;
  // Future<DrugModel>? drugModel;
  Future<HelathModel>? healthModel;
  Future<DrugModel>? drugModel;
  bool isGetHealth = false;
  bool isGetDrug = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapping Testing'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    isGetHealth = true;
                    isGetDrug = true;
                    healthModel = getDummyInspections();
                    drugModel = getDummyDrug();
                  });
                },
                child: Text('API CALL'),
              ),
              ElevatedButton(
                onPressed: ()=> getTest(),
                child: Text('TEST'),
              ),
              space(height: 10),
              isGetHealth 
                ? FutureBuilder<HelathModel>(
                    future: healthModel,
                    builder: (context, snapshot){
                      return snapshot.hasData 
                        ? Text('DATA ON', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).primaryColor),) 
                        : CircularProgressIndicator();
                    }
                  )
                : const Text('Health model is empty'),
              isGetDrug 
                ? FutureBuilder<DrugModel>(
                    future: drugModel,
                    builder: (context, snapshot){
                      return snapshot.hasData 
                        ? Text(
                          snapshot.data!.status,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).primaryColor
                            ),
                          ) 
                        : CircularProgressIndicator();
                    }
                  )
                : const Text('Drug Model is empty'),
            ],
          ),
        ),
      )
    );
  }

  void getTest() async {
    // final String url = 'https://my.api.mockaroo.com/capstone_inspections.json?key=cdedf730';
    final String url = 'https://my.api.mockaroo.com/capstone_my_drug.json?key=cdedf730';
    final logger = Logger();
    final response = await http.get(Uri.parse(url));
    // final response = await http.get(Uri.parse(drugUrl));
    Map<String,dynamic> body = json.decode(response.body);
    logger.d(body);
    // print(response.body);
  }

  Future<HelathModel> getDummyInspections() async {
    final String url = 'https://my.api.mockaroo.com/capstone_inspections.json?key=cdedf730';
    final logger = Logger();
    
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      Map<String,dynamic> body = json.decode(response.body);
      logger.d(body);
      return HelathModel.fromJson(body);
    } else {
      CustomDialog.showDialog(
        title: 'Error',
        content: 'Failed to load post',
      );
      throw Exception('Failed to load post');
    }
  }

  Future<DrugModel> getDummyDrug() async {
    final String url = 'https://my.api.mockaroo.com/capstone_my_drug.json?key=cdedf730';
    final logger = Logger();
    
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      Map<String,dynamic> body = json.decode(response.body);
      logger.d(body);
      return DrugModel.fromJson(body);
    } else {
      CustomDialog.showDialog(
        title: 'Error',
        content: 'Failed to load post',
      );
      throw Exception('Failed to load post');
    }
  }
}



// class TestMode extends StatelessWidget {
//   const TestMode({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     TextEditingController testEdit = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('연수의 테스트모드'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Obx(
//             ()=> TextFormField(
//               controller: testEdit,
//               style: theme.textTheme.bodyText1,
//               decoration: InputDecoration(
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: basicBlack,
//                   ),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: theme.colorScheme.primary,
//                   ),
//                 ),
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: basicBlack,
//                   ),
//                 ),
//                 suffix: TimerController.to.isTimeOut.value
//                   ? Text(
//                       '시간초과',
//                       style: theme.textTheme.caption!.copyWith(
//                         color: theme.errorColor,
//                       ),
//                     )
//                   : Text(
//                       '${TimerController.to.sec.value} : ' 
//                       + '${TimerController.to.time % 60}'.padLeft(2, '0'),
//                       style: theme.textTheme.caption!,
//                     ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 24,
//           ),
//           ElevatedButton(
//             onPressed: () => TimerController.to.start(),
//             child: Text('타이머 시작'),
//           ),
//           ElevatedButton(
//             onPressed: () => TimerController.to.reset(),
//             child: Text('타이머 스탑'),
//           ),
//         ],
//       )
//     );
//   }
// }