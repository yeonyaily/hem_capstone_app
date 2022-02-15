import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/services/service.dart';
import 'package:hem_capstone_app/theme/app_colors.dart';
import 'package:public_health_model/drug_model.dart';

class TreatDetailScreen extends StatelessWidget {
  const TreatDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResultList data = Get.arguments;
    final theme = Theme.of(context);
    String title = Service.getString(data.byungEuiwonYakGukMyung, '[');
    String subTitle =
        Service.getString(data.byungEuiwonYakGukMyung, '[', isSubtile: true);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(390, 72),
          child: SafeArea(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    constraints: BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () => Get.back(),
                    icon: Image.asset(
                      'assets/phi/arrow_left.png',
                    ),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                  space(width: 28),
                  Align(
                    alignment: Alignment(0, -.1),
                    child: Text('진료정보',
                        style: theme.textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: basicBlack,
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              space(height: 24),
              Text(
                title,
                style: theme.textTheme.subtitle1!.copyWith(
                  color: basicBlack,
                ),
              ),
              space(height: 12),
              Text(
                subTitle,
                style: theme.textTheme.bodyText1!.copyWith(
                  color: Color(0xff899A8D),
                )
              ),
              space(height: 48),
              basicInfo(theme, data.jinRyoGaesiIl, 85, '방문일'),
              space(height: 8),
              basicInfo(theme, data.jinRyoHyungTae, 72, '진료형태'),
              space(height: 8),
              basicInfo(theme, data.bangMoonIpWonIlsoo, 36, '방문(입원)일수'),
              space(height: 28),
              Divider(
                color: theme.primaryColor,
                thickness: 1,
              ),
              space(height: 28),
              Text(
                data.retrieveTreatmentInjectionInformationPersonDetailList!.length != 0 ? '처방약' : '데이터가 없습니다.',
                style: theme.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: basicBlack,
                )
              ),
              space(height: 16),
              ...List.generate(
                data.retrieveTreatmentInjectionInformationPersonDetailList!.length,
                (index)=> data.retrieveTreatmentInjectionInformationPersonDetailList!.length != 0 
                  ? InkWell(
                    onTap: ()=> Get.toNamed('/drugDetail', arguments: data.retrieveTreatmentInjectionInformationPersonDetailList![index].retrieveMdsupDtlInfo),
                    child: Container(
                      height: 60,
                      margin: EdgeInsets.only(bottom: 24),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: Image.asset(
                              'assets/phi/pills.png',
                            ),
                          ),
                          space(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                Service.getString(data.retrieveTreatmentInjectionInformationPersonDetailList![index].choBangYakPumMyung, '('),
                                style: theme.textTheme.bodyText2,
                              ),
                              Text(
                                data.retrieveTreatmentInjectionInformationPersonDetailList![index].choBangYakPumHyoneung,
                                style: theme.textTheme.caption!,
                              )
                            ],
                          ),
                          Spacer(),
                          Center(
                            child: Align(
                              alignment: Alignment(0, -.1),
                              child: Text(
                                '${data.retrieveTreatmentInjectionInformationPersonDetailList![index].tuyakIlSoo}일분',
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(.12),
                            offset: Offset(1,1),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ) 
                  : SizedBox(),
              ),
              data.retrieveTreatmentInjectionInformationPersonDetailList!.length != 0 
                ? SizedBox() 
                : Column(
                  children: [
                    space(height: 30),
                    Center(
                      child: SvgPicture.asset(
                        'assets/phi/no_data.svg',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
          ],
        ),
      )
    );
  }

  Row basicInfo(ThemeData theme, String data, double width, String title) {
    return Row(
      children: [
        Text(
          title,
          style: theme.textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        space(width: width),
        Text(
          data,
          style: theme.textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

class MyClipperPath extends CustomClipper<Path> {
  MyClipperPath();

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width * .55, size.height);
    path.lineTo(size.width * .55, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget imageEncoding(String input) {
  var output = Uint8List.fromList(input.codeUnits);
  return ClipPath(
    clipper: MyClipperPath(),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.memory(
        output,
        fit: BoxFit.fill,
      ),
    ),
  );
}
