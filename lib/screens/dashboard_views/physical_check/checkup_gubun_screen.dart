import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/theme/theme.dart';
import 'package:public_health_model/inspections_model.dart';

class CheckUpGobunScreen extends StatelessWidget {
  const CheckUpGobunScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Map<String,dynamic> data = Get.arguments;
    Inspection inspection = data['inspection'];
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
                  alignment: Alignment(0,-.1),
                  child: Text(
                    '${inspection.gubun} 결과',
                    style: theme.textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: basicBlack,
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              space(height: 24),
              Text(
                inspection.gubun,
                style: theme.textTheme.subtitle1,
              ),
              space(height: 4),
              Text(
                data['description'],
                style: theme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff898A8D),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}