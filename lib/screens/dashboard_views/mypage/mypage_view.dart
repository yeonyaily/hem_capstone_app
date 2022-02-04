import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/controllers/widgets/timer_controller.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:hem_capstone_app/theme/app_colors.dart';
import 'package:hem_capstone_app/utils/user/user_util.dart';
import 'package:hem_capstone_app/widgets/custom/custom_dialog/custom_dialog.dart';

class MypageView extends StatelessWidget {
  const MypageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TimerController());
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => AuthController.to.logout(),
            icon: Icon(Icons.exit_to_app),
          ),
          IconButton(
            onPressed: () => Get.to(TestMode()),
            icon: Icon(Icons.security_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              UserUtil.getUser()!.phoneNumber!,
              style: theme.textTheme.headline3!.copyWith(
                color: theme.primaryColor,
              ),
            ),
            ElevatedButton(
              onPressed: () => CustomDialog.showDialog(
                title: '테스팅',
                content: '테스트입니다.',
              ),
              child: const Text('테스트 커스텀 다이얼로그'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.HELP),
              child: const Text('테스트 HELP'),
            ),
          ],
        ),
      )
    );
  }
}

class TestMode extends StatelessWidget {
  const TestMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    TextEditingController testEdit = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('연수의 테스트모드'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(
            ()=> TextFormField(
              controller: testEdit,
              style: theme.textTheme.bodyText1,
              decoration: InputDecoration(
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
                suffix: TimerController.to.isTimeOut.value
                  ? Text(
                      '시간초과',
                      style: theme.textTheme.caption!.copyWith(
                        color: theme.errorColor,
                      ),
                    )
                  : Text(
                      '${TimerController.to.sec.value} : ' 
                      + '${TimerController.to.time % 60}'.padLeft(2, '0'),
                      style: theme.textTheme.caption!,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () => TimerController.to.start(),
            child: Text('타이머 시작'),
          ),
          ElevatedButton(
            onPressed: () => TimerController.to.reset(),
            child: Text('타이머 스탑'),
          ),
        ],
      )
    );
  }
}
