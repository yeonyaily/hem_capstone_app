import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 109.h,
            ),
            Text(
              '공동인증서 등록 전입니다.',
              style: theme.textTheme.headline3,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              '공동인증서를 등록해주세요',
            ),
            SizedBox(
              height: 29.h,
            ),
            Container(
              width: 340.w,
              height: 340.h,
              child: FittedBox(
                child: Image.asset(
                  'assets/images/man1.png',
                ),
              ),
            ),
            SizedBox(
              height: 56.h,
            ),
            Container(
              width: 342.w,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              child: TextButton(
                child: Text(
                  '공동인증서 등록하러 가기',
                  style: theme.textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
