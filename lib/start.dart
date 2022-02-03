import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Start extends StatelessWidget {
  const Start({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(        
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              'assets/logo/logo.svg',
              color: theme.colorScheme.primary,
              height: 232.w,
              width: 232.w,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: ()=> null,
                  child: const Text(
                    '시작하기',
                  ),                  
                ),
                ElevatedButton(
                  onPressed: ()=> null,
                  child: const Text(
                    '테스트모드',
                  ),                  
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}