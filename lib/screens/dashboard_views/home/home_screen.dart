import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:hem_capstone_app/theme/app_colors.dart';
import 'package:hem_capstone_app/utils/user/util.dart';

class HomeScreen extends GetView<AuthController> {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(
      () => Scaffold(
        appBar: !_controller.isCertOn.value
            ? null
            : AppBar(
                centerTitle: true,
                title: Text(
                  'Home',
                  style: theme.textTheme.subtitle1!.copyWith(
                    color: basicBlack,
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: !_controller.isCertOn.value
              ? CertNotExistScreen(theme: theme)
              : CertExistScreen(),
        ),
      ),
    );

    // return GetBuilder<AuthController>(
    //   init: AuthController(),
    //   builder: (_) {
    //     return Scaffold(
    //       appBar: _.isCertOn
    //           ? null
    //           : AppBar(
    //               centerTitle: true,
    //               title: Text(
    //                 'Home',
    //                 style: theme.textTheme.subtitle1!.copyWith(
    //                   color: basicBlack,
    //                 ),
    //               ),
    //               elevation: 0,
    //               backgroundColor: Colors.white,
    //             ),
    //       body: Padding(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: 16,
    //         ),
    //         child: _.isCertOn
    //             ? CertNotExistScreen(theme: theme)
    //             : CertExistScreen(),
    //       ),
    //     );
    //   },
    // );
  }
}

class CertExistScreen extends GetView<CertController> {
  const CertExistScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final age =
        DateTime.now().year - UserUtil.getUser()!.birth!.toDate().year + 1;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          space(height: 16),
          Text(
            '안녕하세요 ${controller.certMap['name']![0].trim()}님 :)',
            style: theme.textTheme.bodyText2!.copyWith(
              color: Color(0xff979797),
            ),
          ),
          Text(
            '${controller.certMap['name']![0].trim()}님의\n건강정보 입니다',
            style: theme.textTheme.headline2!.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
          ),
          space(height: 32),
          basicInfoBox(theme, age),
          space(height: 24),
          certificateBox(theme),
          space(height: 40),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '의료이용 기록 ',
                  style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: '(최근 14개월)',
                  style: theme.textTheme.caption!.copyWith(
                    color: Color(0xff979797),
                  ),
                ),
              ],
            ),
          ),
          space(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 172,
                height: 100,
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/phi/hospital.png',
                        ),
                        space(height: 10),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: HealthUtil.getMedicalData()!.resultList ==
                                    null
                                ? '0'
                                : '병원  ${HealthUtil.getMedicalData()!.resultList!.where((data) => data.jinRyoHyungTae.contains('외래')).length}',
                            style: theme.textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: '회',
                            style: theme.textTheme.caption!,
                          ),
                        ])),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/phi/doctor.png',
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xffCCD1FF),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                width: 172,
                height: 100,
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/phi/heart_2.png',
                        ),
                        space(height: 10),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: HealthUtil.getMedicalData()!.resultList ==
                                    null
                                ? '0'
                                : '약국  ${HealthUtil.getMedicalData()!.resultList!.where((data) => data.jinRyoHyungTae.contains('조제')).length}',
                            style: theme.textTheme.bodyText1!.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: '회',
                            style: theme.textTheme.caption!,
                          ),
                        ])),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/phi/drug.png',
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xffFFD2A9),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          )
        ],
        // children: List.generate(
        //   controller.certMap.values.first.length,
        //   (index) => ListTile(
        //     title: Text(controller.certMap['name']![index]),
        //     subtitle: Text(controller.certMap['valid']![index]),
        //     shape: RoundedRectangleBorder(
        //       side: BorderSide(
        //         color: theme.colorScheme.primary,
        //         width: 2,
        //       ),
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Container certificateBox(ThemeData theme) {
    return Container(
      width: double.infinity,
      height: 128,
      padding: EdgeInsets.fromLTRB(24, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '공동인증서',
                style: theme.textTheme.bodyText1!.copyWith(
                  fontSize: 18,
                ),
              ),
              space(height: 12),
              Text(
                '${controller.certMap['name']![0].trim()}님의 공동인증서',
                style: theme.textTheme.bodyText2,
              ),
              space(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '사용기간 : ',
                      style: theme.textTheme.caption!.copyWith(
                        color: Color(0xff7E7E7E),
                      ),
                    ),
                    TextSpan(
                      text: '${controller.certMap['valid']![0]}',
                      style: theme.textTheme.caption!.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/phi/certificate_ill.png',
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xffFFF4CB).withOpacity(.67),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Container basicInfoBox(ThemeData theme, int age) {
    return Container(
      width: double.infinity,
      height: 128,
      padding: EdgeInsets.fromLTRB(24, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '기본정보',
                style: theme.textTheme.bodyText1!.copyWith(
                  fontSize: 18,
                ),
              ),
              space(height: 12),
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: '$age',
                  style: theme.textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: '세  ',
                  style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 12,
                  ),
                ),
                TextSpan(
                  text: '(만 ${age - 2}세)',
                  style: theme.textTheme.bodyText1!.copyWith(
                    fontSize: 8,
                    color: Color(0xff898A8D),
                  ),
                ),
              ])),
              Text(
                '꾸준한 관리로 건강을 지키세요.',
                style: theme.textTheme.bodyText1!.copyWith(
                  fontSize: 8,
                  color: Color(0xff898A8D),
                ),
              )
            ],
          ),
          Image.asset(
            'assets/phi/basic_info_ill.png',
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xffFFCBCB).withOpacity(.67),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class CertNotExistScreen extends StatelessWidget {
  const CertNotExistScreen({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          space(height: 110.h),
          Text(
            '공동인증서 등록 전입니다.',
            style: theme.textTheme.headline3,
          ),
          space(height: 20.h),
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
          space(height: 56.h),
          SizedBox(
            width: 342.w,
            height: 48,
            child: ElevatedButton(
              onPressed: () => Get.toNamed(Routes.CERTCOPY),
              child: Text(
                '공동인증서 등록하러 가기',
                style: theme.textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: theme.colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
