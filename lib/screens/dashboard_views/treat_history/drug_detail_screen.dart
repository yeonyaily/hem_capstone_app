import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/theme/theme.dart';
import 'package:public_health_model/drug_model.dart';

class DrugDetailScreen extends StatelessWidget {
  const DrugDetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    RetrieveMdsupDtlInfo data = Get.arguments;
    var drugImage = Uint8List.fromList(data.drugImage.codeUnits);
    return Scaffold(
      appBar:  PreferredSize(
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
              Text(
                data.mediPrdcNm,
                style: theme.textTheme.subtitle1,
              ),
              space(height: 20),
              SizedBox(
                width: double.infinity,
                height: 172,
                child:  Image.memory(
                  drugImage,
                  fit: BoxFit.cover,
                ),
              ),
              space(height: 24),
              basicInfo(theme, data.tmsgGnlSpcd, 56, '총 투약일수'),
              space(height: 8),
              basicInfo(theme, data.mohwClsfNoXplnCnte, 69, '약품 효능'),
              space(height: 8),
              basicInfo(theme, data.cmpnInfo, 56, '성분명 정보'),
              space(height: 8),
              basicInfo(theme, data.fomlCdXplnCnte, 69, '약품 제형'),
              space(height: 8),
              basicInfo(theme, data.mdctPathXplnCnte, 72, '투여경로'),
              space(height: 8),
              basicInfo(theme, data.upsoName, 85, '업체명'),
              space(height: 24),
              Divider(
                color: theme.primaryColor,
                thickness: 1,
              ),
              space(height: 24),
              Text(
                '의약품 세부정보',
                style: theme.textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              space(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '용법 용량',
                    style: theme.textTheme.bodyText2,
                  ),
                  space(width: 72),
                  Container(
                    width: 192,
                    child: Text(
                      data.efftEftCnte,
                      style: theme.textTheme.bodyText2,                    
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
  Row basicInfo(ThemeData theme, String data, double width, String title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        space(width: width),
        Expanded(
          child: Text(
            data,
            style: theme.textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}