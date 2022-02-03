import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';

import 'binding/init_binding.dart';

class PublicHealthInfo extends StatelessWidget {
  const PublicHealthInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: InitBinding(),
        initialRoute: '/',
        getPages: AppPages.routes,
        title: 'Public Health Info',
        // theme: AppTheme.lightThemeData,
        home: Scaffold(
          body: Center(
            child: Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 0, 61, 165),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Loading',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
