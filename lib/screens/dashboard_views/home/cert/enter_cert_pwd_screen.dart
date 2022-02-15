import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:hem_capstone_app/theme/app_colors.dart';

class EnterCertPwdPage extends GetView<CertController> {
  EnterCertPwdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
            ? Center(
                child: Container(
                  width: Get.width * 0.3,
                  height: Get.width * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 0, 61, 165),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '건강정보를\n불러오는 중입니다.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        space(height: 48.h),
                        Text(
                          '공동인증서 비밀번호를\n입력해주세요:)',
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
                          '공동인증서 비밀번호',
                          style: theme.textTheme.caption!.copyWith(
                            color: Colors.black38,
                          ),
                        ),
                        TextFormField(
                          // obscureText: true,
                          autovalidateMode:
                              AutovalidateMode.onUserInteraction,
                          controller: controller.certPwdController,
                          style: theme.textTheme.bodyText1,
                          maxLength: 30,
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
                          onChanged: (value) {
                            if (value.length >= 10 &&
                                (value.contains('!') ||
                                    value.contains('@') ||
                                    value.contains('#') ||
                                    value.contains('\$') ||
                                    value.contains('%') ||
                                    value.contains('^') ||
                                    value.contains('&') ||
                                    value.contains('*'))) {
                              controller.isPwd.value = true;
                            } else {
                              controller.isPwd.value = false;
                            }
                          },
                          validator: (value) {
                            if (value!.length < 10) {
                              return '(필수 : 특수문자를 포함 10자리 이상)';
                            }
                          },
                          keyboardType: TextInputType.text,
                        ),
                        space(height: 48.h),
                      ],
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Container(
                        // alignment: Alignment.center,
                        width: Get.width,
                        height: 48,
                        child: controller.isPwd.value
                          ? ElevatedButton(
                              onPressed: () async {
                                controller.callHealthApi(
                                  '1b94ed1781e044d385e0f86ec7d29b93',
                                  CertController.to.certMap['file']!.first,
                                  controller.certPwdController.text.trim(),
                                ).then((value) {
                                  controller.detectCert();
                                  Get.toNamed(Routes.DASHBOARD);
                                });
                              },
                              child: Text('건강정보불러오기'),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            )
                          : TextButton(
                              onPressed: () {},
                              child: Text('건강정보불러오기'),
                              style: TextButton.styleFrom(
                                elevation: 0,
                                primary: Colors.white,
                                backgroundColor: Colors.black12,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
