import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/controllers/widgets/timer_controller.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:hem_capstone_app/screens/dashboard_views/mypage/hidden_test.dart';
import 'package:hem_capstone_app/theme/app_colors.dart';
import 'package:hem_capstone_app/utils/user/user_util.dart';
import 'package:hem_capstone_app/widgets/custom/custom_dialog/custom_dialog.dart';

class MypageView extends StatelessWidget {
  const MypageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => AuthController.to.logout(),
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Text(
          //   UserUtil.getUser()!.phoneNumber!,
          //   style: theme.textTheme.headline3!.copyWith(
          //     color: theme.primaryColor,
          //   ),
          // ),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: () => CustomDialog.showDialog(
                  title: '테스팅',
                  content: '테스트입니다.',
                ),
                child: const Text('테스트 커스텀 다이얼로그'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: ()=> Get.to(()=> HiddenTestMode()),
              child: Container(
                width: 32,
                height: 32,           
              ),
            )
          )
        ],
      )
    );
  }
}
