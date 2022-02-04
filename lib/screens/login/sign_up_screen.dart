import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/auth/auth_controller.dart';
import 'package:hem_capstone_app/controllers/signup/signup_controller.dart';
import 'package:hem_capstone_app/theme/theme.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset : false,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Image.asset(
                  'assets/phi/arrow_back.png',
                ),
                onPressed: ()=> Get.back(),
              ),
            ),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '휴대폰 번호를 입력해주세요:)',
                        style: theme.textTheme.headline3,
                      ),
                      space(height: 12),
                      Text(
                        '본인인증을 위해 필요합니다.',
                        style: theme.textTheme.caption!.copyWith(
                          color: Color(0xffc4c4c4),
                        )
                      ),
                      space(height: 54),
                      Text(
                        '휴대폰 번호',
                        style: theme.textTheme.caption!.copyWith(
                          color: Color(0xff979797),
                        )
                      ), 
                      Obx(
                        ()=> TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.phoneNumberController,
                          style: theme.textTheme.bodyText1,
                          maxLength: 11,
                          autofocus: true,
                          cursorColor: basicBlack,
                          decoration: InputDecoration(
                            counterText: "",
                            fillColor: Colors.transparent,
                            enabledBorder: UnderlineInputBorder(      
                              borderSide: BorderSide(
                                color: basicBlack,
                              ),   
                            ),  
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: basicBlack,
                              ),
                            ),
                            suffixIcon: controller.isPhoneNumber.value 
                              ? IconButton(
                                  onPressed: (){
                                    controller.phoneNumberController.clear(); 
                                    controller.isPhoneNumber.value = false;
                                  },
                                  icon: Image.asset(
                                    'assets/phi/phone_edit_clear.png',
                                  ),
                                ) 
                              : null,                      
                          ),
                          onChanged: (value) {
                            if (value.length > 7) {
                              controller.isPhoneNumber.value = true;
                            } else {
                              controller.isPhoneNumber.value = false;
                            }
                            if(value.length > 2){
                              if(value.substring(0,3) != '010'){
                                controller.isPhoneNumberVaild.value = false;                                
                              } else {
                                controller.isPhoneNumberVaild.value = true;
                              }
                            }
                          },
                          validator: (value){
                            if(value!.length > 2){
                              if(value.substring(0,3) != '010'){
                                return '잘못된 휴대폰 번호입니다.';
                              } 
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]'),
                            ),
                          ],
                        ),
                      ),
                      space(height: 37),
                      Obx(
                        ()=> controller.isSendAuthNumber.value
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '인증번호',
                                  style: theme.textTheme.caption!.copyWith(
                                    color: Color(0xff979797),
                                  )
                                ), 
                                TextFormField(
                                  controller: controller.phoneAuthNumberController,
                                  style: theme.textTheme.bodyText1,
                                  maxLength: 6,
                                  focusNode: controller.focusNode,
                                  cursorColor: basicBlack,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    fillColor: Colors.transparent,
                                    enabledBorder: UnderlineInputBorder(      
                                      borderSide: BorderSide(
                                        color: basicBlack,
                                      ),   
                                    ),  
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: basicBlack,
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.length == 6) {
                                      controller.isPhoneAuthNumber.value = true;
                                    } else {
                                      controller.isPhoneAuthNumber.value = false;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                  ],
                                ),
                                space(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Spacer(),
                                    Text(
                                      '인증코드 다시받기',
                                      style: theme.textTheme.caption!.copyWith(
                                        color: Color(0xffDBDBDB),
                                      )
                                    ),
                                    SizedBox(width: 10,),
                                    GestureDetector(
                                      onTap: ()=> _signInwithPhoneNumber(),
                                      child: Text(
                                        '재전송',
                                        style: theme.textTheme.caption!.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: theme.primaryColor,
                                        )
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          : space(),
                      ),
                      space(height: 32),
                      Center(
                        child: GestureDetector(
                          onTap: ()=> print('도움'),
                          child: Text(
                            '도움이 필요하신가요?',
                            style: theme.textTheme.caption,
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: ()=> print('휴대폰 번호 변경'),
                          child: Text(
                            '휴대폰 번호를 변경하셨나요?',
                            style: theme.textTheme.caption,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Obx(
                () => controller.isSendAuthNumber.value
                  ? Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                        width: Get.width,
                        height: 48,
                        child: Obx(
                          () => ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              controller.isPhoneAuthNumber.value
                                  ? _signInwithPhoneNumber()
                                  : null;
                            },
                            child: Text(
                              '인증번호 확인',
                              style: theme.textTheme.button!.copyWith(
                                color: controller.isPhoneAuthNumber.value
                                  ? Colors.white
                                  : Color(0xff979797),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: controller.isPhoneAuthNumber.value
                                  ? theme.primaryColor
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                        width: Get.width,
                        height: 48,
                        child: Obx(
                          () => ElevatedButton(
                            onPressed: () {
                              controller.isPhoneNumber.value && controller.isPhoneNumberVaild.value
                                 ? [FocusScope.of(context).unfocus(), _requestAuthNumber(context)]                                        
                                 : null;
                            },
                            child: Text(
                              '인증번호 요청',
                              style: theme.textTheme.button!.copyWith(
                                color: controller.isPhoneNumber.value && controller.isPhoneNumberVaild.value
                                  ? Colors.white
                                  : Color(0xff979797),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: controller.isPhoneNumber.value && controller.isPhoneNumberVaild.value
                                  ? theme.primaryColor
                                  : Colors.grey[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              splashFactory: controller.isPhoneNumber.value ? null : NoSplash.splashFactory,
                            ),
                          ),
                        ),
                      ),
                  ),
                ),
              ],
            )
          ),
          Obx(
            () => Visibility(
              visible: controller.isLoading.value,
              child: Container(
                color: Colors.black26,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 16),
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
          )
        ],
      ),
    );
  }

  Future<void> _signInwithPhoneNumber() async {
    controller.isLoading.value = true;
    await AuthController.to.signInWithPhoneNumber();
  }

  Future<void> _requestAuthNumber(BuildContext context) async {
    controller.isLoading.value = true;
    await AuthController.to.sendOTPNumber();
    controller.requestFocus(context);
    //
  }
}
