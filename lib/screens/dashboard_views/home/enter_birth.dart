import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/widgets/datetimepicker_controller.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';

class EnterBirthPage extends GetView<DatetimePickerController> {
  EnterBirthPage({Key? key}) : super(key: key);

  // DatetimePickerController _controller = Get.put(DatetimePickerController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              space(height: 48.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '생년월일을 입력해주세요:)',
                    style: theme.textTheme.headline3,
                  ),
                  space(height: 12),
                  Text(
                    '공공 API를 사용하기 위해서 필요합니다.',
                    style: theme.textTheme.caption!.copyWith(
                      color: Colors.black26,
                    ),
                  ),
                  space(height: 46.h),
                  GetBuilder<DatetimePickerController>(
                    builder: (_) {
                      return Text("${controller.selectedDate.toString()}");
                    },
                  ),
                  Container(
                    width: 334.w,
                    height: 373.h,
                    child: CupertinoDatePicker(
                      minimumYear: 1950,
                      maximumYear: DateTime.now().year,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (value) {
                        controller.onDateTimeChanged(value);
                      },
                      initialDateTime: DateTime.now(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(height: 48.h, width: 155.w),
                        child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            '이전',
                            style: theme.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                      space(width: 24.w),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(height: 48.h, width: 155.w),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.addBirthInfo();
                            Get.toNamed(Routes.ENTERPWD);
                          },
                          child: Text(
                            '다음',
                            style: theme.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
