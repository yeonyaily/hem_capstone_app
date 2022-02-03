import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'binding/init_binding.dart';
import 'routes/app_pages.dart';
import 'start.dart';
import 'theme/theme.dart';

class PublicHealthInfo extends StatelessWidget {
  const PublicHealthInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: ()=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',  
        initialBinding: InitBinding(),
        getPages: AppPages.routes,
        title: 'PHI',  
        builder: (context, child) {
          // ScreenUtil.setContext(context);
          return MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        theme: AppTheme.lightThemeData,
        home: const Start(),
      ),
    );
  }
}

// class PublicHealthInfo extends StatelessWidget {
//   const PublicHealthInfo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(390, 844),
//       builder: ()=> GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: '/',
//         initialBinding: InitBinding(),
//         getPages: AppPages.routes,
//         title: 'PHI',
//         theme: AppTheme.lightThemeData,
//         home: const Start(),
//       ),
//     );
//   }
// }