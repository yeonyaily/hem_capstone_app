import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/theme/theme.dart';
import 'package:hem_capstone_app/utils/user/health_util.dart';

class InspectionDetailView extends StatelessWidget {
  InspectionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final data = HealthUtil.getInspectionData();
    Map<String, dynamic> dummy = {
      '신장': 170.5,
      '체중': 51.2,
      '허리둘레': 60.0,
      '체질량지수': 23.6,
      '시력(좌/우)': '0.6/0.9',
      '청각(좌/우)': '정상/정상',
      '혈압(최고/최저)': '110/62',
    };
    var keys = dummy.keys.toList();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(390, 72),
          child: SafeArea(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    constraints: BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () => Get.back(),
                    icon: Image.asset(
                      'assets/phi/arrow_left.png',
                    ),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                  space(width: 28),
                  Align(
                    alignment: Alignment(0, -.1),
                    child: Text(
                      '계측검사 결과',
                      style: theme.textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: basicBlack,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space(height: 24),
              Text(
                '계측검사',
                style: theme.textTheme.subtitle1,
              ),
              space(height: 4),
              Text(
                '비만과 관련된 체중이나 신장과 같은 기본 정보를 알려드립니다',
                style: theme.textTheme.caption!.copyWith(
                  color: Colors.grey,
                ),
              ),
              space(height: 16),
              Divider(
                color: theme.colorScheme.primary,
                thickness: 1,
              ),
              space(height: 16),
              Text(
                '비만',
                style: theme.textTheme.subtitle2!
                    .copyWith(color: theme.colorScheme.primary),
              ),
              space(height: 8),
              Expanded(
                child: ListView.builder(
                    itemCount: dummy.length,
                    itemBuilder: (BuildContext context, int index) {
                      String key = dummy.keys.elementAt(index);
                      return Container(
                        height: 38.h,
                        child: Row(
                          children: [
                            Container(
                              width: 160.w,
                              child: Text(
                                '${key}',
                                style: theme.textTheme.button,
                              ),
                            ),
                            Container(
                              child: Text(
                                dummy[key].toString(),
                                style: theme.textTheme.bodyText1!
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
