import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/theme/theme.dart';
import 'package:hem_capstone_app/utils/user/util.dart';
import 'package:public_health_model/inspections_model.dart';

class CheckUpDetailScreen extends GetView<HealthCheckController> {
  const CheckUpDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ResultList data = Get.arguments;
    String date = '${data.year}.${data.checkUpDate.split('/')[0]}.${data.checkUpDate.split('/')[1]}'; 
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
                  alignment: Alignment(0,-.1),
                  child: Text(
                    '약 상세정보',
                    style: theme.textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: basicBlack,
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              space(height: 24),
              Text.rich(
                TextSpan(
                  children:[
                    TextSpan(
                      text: UserUtil.getUser()!.name,
                      style: theme.textTheme.bodyText1!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w700,
                      )
                    ),
                    TextSpan(
                      text: '님의 ',
                      style: theme.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                      )
                    ),
                    TextSpan(
                      text: data.year,
                      style: theme.textTheme.bodyText1!.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '년도 건강검진 결과',
                      style: theme.textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                      )
                    ),
                  ],
                ),
              ),
              space(height: 16),
              Divider(
                color: theme.primaryColor,
                height: 3,
              ),
              space(height: 16),
              Row(
                children: <Widget>[
                  Text(
                    '방문일',
                    style: theme.textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w700,
                    )
                  ),
                  space(width: 55),
                  Text(
                    date,
                    style: theme.textTheme.bodyText2,
                  ),
                ],
              ),
              space(height: 8),
              Row(
                children: <Widget>[
                  Text(
                    '검진장소',
                    style: theme.textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w700,
                    )
                  ),
                  space(width: 42),
                  Text(
                    data.location,
                    style: theme.textTheme.bodyText2,
                  ),
                ],
              ),
              space(height: 16),
              Divider(
                color: theme.primaryColor,
                height: 1,
              ),
              space(height :24),
              Text(
                '검진 기록 구분',
                style: theme.textTheme.subtitle2,
              ),
              space(height: 16),
              ...List.generate(controller.healthRecordDummy.length, (index) => 
                InkWell(
                  onTap: ()=> Get.toNamed(
                    '/checkupGubun',
                    arguments: {
                      'inspection': data.inspections![index], 
                      'description': controller.healthRecordDummy[index]['subtile'],
                    },
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    padding: EdgeInsets.fromLTRB(32, 14, 0, 0),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              controller.healthRecordDummy[index]['title'].toString(),
                              style: theme.textTheme.subtitle2,
                            ),
                            Container(
                              width: 160,
                              child: Text(
                                controller.healthRecordDummy[index]['subTitle'].toString(),
                                style: theme.textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff898A8D),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/phi/health_check_${index}.png',
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff15C5BA).withOpacity(.28),
                      borderRadius: BorderRadius.circular(16),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),      
    );
  }
}