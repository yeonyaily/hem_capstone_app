import 'package:flutter/material.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/utils/user/user_util.dart';
import 'package:hem_capstone_app/widgets/custom/custom_dialog/custom_dialog.dart';

class MypageView extends StatelessWidget {
  const MypageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()=> AuthController.to.logout(),
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              UserUtil.getUser()!.phoneNumber!,
              style: theme.textTheme.headline3!.copyWith(
                color: theme.primaryColor,
              ),
            ),
            ElevatedButton(
              onPressed: ()=> CustomDialog.showDialog(
                title: '테스팅',
                content: '테스트입니다.',
              ),
              child: const Text('테스트모드'),
            ),
          ],
        ),
      )
    );
  }
}
