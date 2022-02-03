import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/phi/arrow_back.png',
          ),
          onPressed: ()=> Get.back(),
        ),
      ),
      body: Center(
        child: Text(
          '휴대폰 인증'
        ),
      )
    );
  }
}