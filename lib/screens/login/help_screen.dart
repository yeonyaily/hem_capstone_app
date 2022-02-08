import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '고객센터',
          style: theme.textTheme.bodyText1!.copyWith(
            color: theme.primaryColor,
          ),
        ),
        leading: IconButton(
          constraints: BoxConstraints(),
          padding: EdgeInsets.zero,
          icon: Image.asset(
            'assets/phi/arrow_back.png',
          ),
          onPressed: ()=> Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '도움이 필요하신가요?',
              style: theme.textTheme.headline3,
            ),
            space(height: 16),
            Text(
              '고객님, 도움이 필요하신가요?',              
              style: theme.textTheme.caption!.copyWith(
                color: Color(0xffC4C4C4),
              ),
            ),
            space(height: 48), 
            Row(
              children: [
                Container(
                  width: 152,
                  height: 152,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.primaryColor,
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      space(height: 24),
                      Image.asset(
                        'assets/phi/help.png',
                      ),
                      space(height: 16),
                      Text(
                        '전화로 문의하기',
                        style: theme.textTheme.bodyText1!.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                      space(height: 4),
                      Text(
                        '010-7290-1164',
                        style: TextStyle(
                          color: Color(0xff898A8D),
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: 'NotoSansKR',
                        ),
                      )
                    ],
                  ),
                ),
                space(width: 36),
                Container(
                  width: 152,
                  height: 152,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.primaryColor,
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      space(height: 28),
                      Image.asset(
                        'assets/phi/help_chat.png',                        
                      ),
                      space(height: 20),
                      Text(
                        '1:1 문의하기',
                        style: theme.textTheme.bodyText1!.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            space(height: 48),
            Divider(
              color: Color(0xffE3E3E3),
              thickness: 1,
            ),
            space(height: 16),
            alarm(theme, '•  오전 10시~오후 6시까지 운영합니다.'),
            alarm(theme, '•  토,일요일 및 공휴일은 휴무입니다.'),
          ],
        ),
      )
    );
  }

  Text alarm(ThemeData theme, String text) {
    return Text(
      text,
      style: theme.textTheme.caption!.copyWith(
        color: Color(0xff979797),
      ),
    );
  }
}