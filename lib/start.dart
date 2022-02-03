import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hem_capstone_app/constant/constant.dart';

class Start extends StatelessWidget {
  const Start({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(        
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/logo/logo.svg',
                        // color: theme.colorScheme.primary,
                        height: 232.w,
                        width: 232.w,
                      ),
                      Text(
                        '당신의 하나뿐인\n약 알림메이트',
                        style: theme.textTheme.headline2!.copyWith(
                          fontSize: 36.sp,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                        onPressed: ()=> null,
                        child: const Text(
                          '시작하기',
                        ),                  
                      ),
                    ),
                    space(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                        onPressed: ()=> null,
                        child: const Text(
                          '테스트모드',
                        ),                  
                      ),
                    ),
                    space(height: 24.h),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}