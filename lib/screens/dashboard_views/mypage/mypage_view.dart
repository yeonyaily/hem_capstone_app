import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
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
        title: Text(
          '내 정보',
          style: theme.textTheme.bodyText1!.copyWith(
            fontSize: 18,
            color: Colors.white,
          )
        ),
        centerTitle: true,
        actions: [
          SizedBox(
            width: 54,
            height: 24,
            child: ElevatedButton.icon(
              onPressed: ()=> null, 
              icon: Image.asset(
                'assets/phi/setting.png',
              ), 
              label: Text(
                'text',
                style: theme.textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: theme.primaryColor,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: theme.primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
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
              ),
            ),
          ),
        ],
      )
    );
  }
}
