import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hem_capstone_app/controllers/dashboard/cert_copy/cert_copy_controller.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';

class CertOnPage extends GetView<CertCopyController> {
  CertOnPage({Key? key}) : super(key: key);

  // CertCopyController _controller2 = Get.put(CertCopyController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 240.h,
              ),
              Text(
                '공동인증서가 등록되었습니다',
                style: theme.textTheme.subtitle1,
              ),
              SizedBox(
                height: 44.h,
              ),
              SizedBox(
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 90.h,
                    width: 310.w,
                    // margin: EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 60.h,
                          child: Image.asset(
                            'assets/images/cert.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${controller.certMap['name']![0]}' + '님의 공동인증서',
                              style: theme.textTheme.bodyText1,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  '사용기간 : ',
                                  style: theme.textTheme.caption!
                                      .copyWith(color: Colors.black26),
                                ),
                                Text(
                                  '${controller.certMap['valid']![0]}',
                                  style: theme.textTheme.caption!.copyWith(
                                    color: theme.colorScheme.primary,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 244.h,
              ),
              Container(
                width: 342.w,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.ENTERBIRTH);
                  },
                  child: Text(
                    '건강 정보 불러오기',
                    style: theme.textTheme.bodyText1!
                        .copyWith(color: Colors.white),
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
