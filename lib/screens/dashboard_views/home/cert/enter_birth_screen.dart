import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:hem_capstone_app/theme/theme.dart';
import 'package:logger/logger.dart';

class EnterBirthPage extends GetView<CertController> {
  EnterBirthPage({Key? key}) : super(key: key);

  final logger = Logger();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(height: 48.h),
                  Text(
                    '주민등록번호를 입력해주세요:)',
                    style: theme.textTheme.headline3,
                  ),
                  space(height: 12),
                  Text(
                    '공공 API를 사용하기 위해서 필요합니다.',
                    style: theme.textTheme.caption!.copyWith(
                      color: Colors.black26,
                    ),
                  ),
                  space(height: 44.h),
                  Text(
                    '주민등록번호',
                    style: theme.textTheme.caption!.copyWith(
                      color: Colors.black38,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 132.w,
                        child: TextFormField(
                          // obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.identityHeadNumController,
                          style: theme.textTheme.bodyText1,
                          maxLength: 6,
                          autofocus: true,
                          cursorColor: basicBlack,
                          decoration: InputDecoration(
                            counterText: "",
                            fillColor: Colors.transparent,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: basicBlack,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: basicBlack,
                              ),
                            ),
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value!.length < 6) {
                              return '(주민등록번호 앞6자리)';
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      space(width: 16.w),
                      Text(
                        '-',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.normal),
                      ),
                      space(width: 16.w),
                      Container(
                        width: 132.w,
                        child: TextFormField(
                          // obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.identityBackNumController,
                          style: theme.textTheme.bodyText1,
                          maxLength: 7,
                          autofocus: true,
                          cursorColor: basicBlack,
                          decoration: InputDecoration(
                            counterText: "",
                            fillColor: Colors.transparent,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: basicBlack,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: basicBlack,
                              ),
                            ),
                          ),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value!.length < 7) {
                              return '(주민등록번호 뒷6자리)';
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                width: Get.width,
                child: ElevatedButton(
                  child: Text('다음'),
                  onPressed: () {
                    controller.identityNum =
                        controller.identityHeadNumController.text.trim() +
                            controller.identityBackNumController.text.trim();
                    logger.d(controller.identityNum);
                    logger.d(controller.identityHeadNumController.text.trim() +
                        controller.identityBackNumController.text.trim());
                    print(controller.identityNum);
                    print(controller.identityHeadNumController.text.trim() +
                        controller.identityBackNumController.text.trim());
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(auth.currentUser!.uid)
                        .update({
                      'identityNum':
                          controller.identityHeadNumController.text.trim() +
                              controller.identityBackNumController.text.trim(),
                    });

                    if (controller.identityBackNumController.text
                            .substring(0, 1) ==
                        '1') {
                      logger.d(controller.identityBackNumController.text
                          .substring(0, 1));
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(auth.currentUser!.uid)
                          .update({'gender': '남'});
                    } else {
                      logger.d(controller.identityBackNumController.text
                          .substring(0, 1));
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(auth.currentUser!.uid)
                          .update({'gender': '여'});
                    }

                    Get.toNamed(Routes.ENTERPWD);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: 132.w,
//                                 child: TextFormField(
//                                   // obscureText: true,
//                                   autovalidateMode:
//                                       AutovalidateMode.onUserInteraction,
//                                   controller:
//                                       controller.identityHeadNumController,
//                                   style: theme.textTheme.bodyText1,
//                                   maxLength: 6,
//                                   autofocus: true,
//                                   cursorColor: basicBlack,
//                                   decoration: InputDecoration(
//                                     counterText: "",
//                                     fillColor: Colors.transparent,
//                                     enabledBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: basicBlack,
//                                       ),
//                                     ),
//                                     focusedBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: theme.colorScheme.primary,
//                                       ),
//                                     ),
//                                     border: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: basicBlack,
//                                       ),
//                                     ),
//                                   ),
//                                   onChanged: (value) {},
//                                   validator: (value) {
//                                     if (value!.length < 6) {
//                                       return '(주민등록번호 앞6자리)';
//                                     }
//                                   },
//                                   keyboardType: TextInputType.text,
//                                 ),
//                               ),
//                               space(width: 16.w),
//                               Text(
//                                 '-',
//                                 style: TextStyle(
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.normal),
//                               ),
//                               space(width: 16.w),
//                               Container(
//                                 width: 132.w,
//                                 child: TextFormField(
//                                   // obscureText: true,
//                                   autovalidateMode:
//                                       AutovalidateMode.onUserInteraction,
//                                   controller:
//                                       controller.identityBackNumController,
//                                   style: theme.textTheme.bodyText1,
//                                   maxLength: 7,
//                                   autofocus: true,
//                                   cursorColor: basicBlack,
//                                   decoration: InputDecoration(
//                                     counterText: "",
//                                     fillColor: Colors.transparent,
//                                     enabledBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: basicBlack,
//                                       ),
//                                     ),
//                                     focusedBorder: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: theme.colorScheme.primary,
//                                       ),
//                                     ),
//                                     border: UnderlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: basicBlack,
//                                       ),
//                                     ),
//                                   ),
//                                   onChanged: (value) {},
//                                   validator: (value) {
//                                     if (value!.length < 7) {
//                                       return '(주민등록번호 뒷6자리)';
//                                     }
//                                   },
//                                   keyboardType: TextInputType.text,
//                                 ),
//                               ),
//                             ],
//                           ),