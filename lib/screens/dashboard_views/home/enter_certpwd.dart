import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/dashboard/cert_pwd/cert_pwd_controller.dart';
import 'package:hem_capstone_app/controllers/widgets/datetimepicker_controller.dart';
import 'package:hem_capstone_app/theme/app_colors.dart';
import 'package:tilko_plugin/tilko_plugin.dart';

class EnterCertPwdPage extends GetView<CertPwdController> {
  EnterCertPwdPage({Key? key}) : super(key: key);

  // CertPwdController _controller = Get.put(CertPwdController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: Column(
                    children: [
                      Text(
                        '건강 정보를 불러오고 있어요',
                      ),
                      space(height: 24),
                      LinearProgressIndicator(),
                    ],
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
                            obscureText: true,
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
                                controller.approvePwd();
                              } else {
                                controller.disapprovePwd();
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
                                    controller.switchLoading();
                                    await Future.delayed(
                                      const Duration(seconds: 2),
                                    );
                                    controller.switchLoading();
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
