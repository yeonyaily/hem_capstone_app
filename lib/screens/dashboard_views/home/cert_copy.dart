import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/dashboard/cert_copy/cert_copy_controller.dart';

class CertCopyPage extends GetView {
  CertCopyPage({Key? key}) : super(key: key);

  // String frontKey = "    ";
  // String backKey = "    ";
  CertCopyController _controller = Get.put(CertCopyController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('공동인증서 등록'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PC에서 공동인증서\n(구 공인인증서)를 복사해\n휴대폰으로 전달해주세요. ',
                  style: theme.textTheme.subtitle1!.copyWith(
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '1. PC에서 ',
                          style: theme.textTheme.caption!
                              .copyWith(color: Colors.black38),
                        ),
                        Text(
                          'cert.tilko.net',
                          style: theme.textTheme.caption!.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Text(
                          '에 접속해주세요.',
                          style: theme.textTheme.caption!
                              .copyWith(color: Colors.black38),
                        ),
                      ],
                    ),
                    Text(
                      '2. 공동인증서 복사하기 버튼을 클릭해주세요.',
                      style: theme.textTheme.caption!
                          .copyWith(color: Colors.black38),
                    ),
                    Text(
                      '3. 공동인증서 로그인 후 아래 인증번호를 입력해주세요. ',
                      style: theme.textTheme.caption!
                          .copyWith(color: Colors.black38),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Row(
                  children: [
                    Expanded(child: const Text('인증번호')),
                    IconButton(
                      onPressed: () {
                        _controller.getKey();
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: theme.colorScheme.primary,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 9.h),
                Obx(
                  () => Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 143.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(36, 10, 36, 10),
                            child: Text(
                              "${Get.find<CertCopyController>().frontKey.value}",
                              style: TextStyle(
                                fontSize: 20,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'ㅡ',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 143.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(36, 10, 36, 10),
                            child: Text(
                              "${Get.find<CertCopyController>().backKey.value}",
                              style: TextStyle(
                                fontSize: 20,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
