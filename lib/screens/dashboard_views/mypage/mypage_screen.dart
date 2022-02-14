import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:hem_capstone_app/screens/dashboard_views/mypage/hidden_test.dart';
import 'package:hem_capstone_app/screens/dashboard_views/mypage/membership_withdraw_screen.dart';

class MypageView extends StatelessWidget {
  const MypageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.primaryColor,
        title: Text(
          '내 정보',
          style: theme.textTheme.bodyText1!.copyWith(
            fontSize: 18,
            color: Colors.white,
          )
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: ()=> print('setting'),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Container(      
                margin: const EdgeInsets.only(right: 16),    
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/phi/setting.png',
                    ),
                    space(width: 3),
                    Text(
                      '설정',
                      style: theme.textTheme.bodyText1!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),          
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  color: theme.primaryColor,
                  padding: const EdgeInsets.only(left: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment(0,-.7),
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/phi/profile.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                      space(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          space(height: 21),
                          Text(
                            '홍길동님',
                            style: theme.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '1998.01.23',
                            style: theme.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      space(height: 56),
                      Container(
                        height: 8,
                        color: Color(0xffEFEFEF),
                      ),
                      mainMenu(theme, 'assets/phi/notice.png', '공지사항', ()=> print('공지사항')),
                      mainMenu(theme, 'assets/phi/call.png', '고객센터', ()=> Get.toNamed(Routes.HELP)),
                      mainMenu(theme, 'assets/phi/push.png', '푸시알림', ()=> null),
                      mainMenu(theme, 'assets/phi/more.png', '더 보기', ()=> print('더 보기')),                      
                      space(height: 36),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            authStateButton(theme, '회원탈퇴', ()=> Get.to(()=> MembershipWithdrawScreen())),
                            authStateButton(theme, '로그아웃', ()=> logOutDialog()),
                          ],
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
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 111.h,
            left: 40,
            right: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                menu(theme, 'assets/phi/box.png', '배송관리'),
                menu(theme, 'assets/phi/heart.png', '복약관리'),
                menu(theme, 'assets/phi/family.png', '가족계정'),
              ],
            )
          )
        ],
      )
    );
  }

  SizedBox authStateButton(
    ThemeData theme,
    String text,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 164,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: theme.textTheme.caption!.copyWith(
            color: Color(0xff747474),
            fontWeight: FontWeight.w400,
          ),
        ),
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          primary: Color(0xffEEEEEE),
        ),
      ),
    );
  }

  Widget mainMenu(
    ThemeData theme, 
    String iconPath, 
    String text,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.only(left: 40, right: 34),
        width: double.infinity,
        height: 64,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xffE3E3E3),
            )
          )
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            space(width: 8),
            Expanded(
              child: Text(
                text,
                style: theme.textTheme.bodyText2!.copyWith(
                  height: 1.15,
                ),
              ),
            ),
            text == '푸시알림' 
            ? Obx(
                ()=> SizedBox(
                  width: 48,
                  height: 36,
                  child: Switch(
                    value: SwitchController.to.initValue.value,
                    onChanged: (value)=> SwitchController.to.initValue.toggle(),
                    activeColor: theme.primaryColor,
                  ),
                ),
            )
            : Image.asset(
                'assets/phi/ios_arrow.png',
              )
          ],
        ),
      ),
    );
  }

  Future<void> logOutDialog() {
    return Get.dialog(
      Builder(
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Center(
            child: Text(
              '로그아웃',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '로그아웃하시겠습니까?',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: new Text("확인"),
              onPressed: ()=> [Get.back(),AuthController.to.logout(),]
            ),
            TextButton(
              child: new Text("취소"),
              onPressed: ()=> Get.back(),
            ),
          ],
        );
      }
    ),
    barrierDismissible: false,
    );
  }

  Widget menu(
    ThemeData theme, 
    String imagePath, 
    String text
  ) {
    return InkWell(
      onTap: ()=> print('Hello'),
      child: Container(
        width: 72,
        height: 72,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.25),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              imagePath,
            ),
            Text(
              text,
              style: theme.textTheme.caption!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        )
      ),
    );
  }
}
