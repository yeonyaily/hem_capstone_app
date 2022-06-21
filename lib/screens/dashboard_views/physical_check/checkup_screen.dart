import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/controller.dart';
import 'package:hem_capstone_app/routes/app_pages.dart';
import 'package:hem_capstone_app/theme/theme.dart';
import 'package:hem_capstone_app/utils/user/util.dart';

class HealthCheckUpScreen extends GetView<HealthCheckController> {
  const HealthCheckUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '검진 내역',
          style: theme.textTheme.subtitle1!.copyWith(
            color: basicBlack,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              space(height: 24),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      children: [
                        TextSpan(
                          text: UserUtil.getUser()!.name,
                          style: theme.textTheme.bodyText1!.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w700,
                          )
                        ),
                        TextSpan(
                          text: '님의 건강검진 결과',
                          style: theme.textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w700,                        
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ), 
              space(height: 16),
              controller.inspectionModel!.resultList != null
                ? controller.inspectionModel!.resultList![0].year != ''
                  ? DataTable(
                      headingTextStyle: theme.textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      columnSpacing: 0,
                      horizontalMargin: 0,
                      headingRowHeight: controller.headingRowHeight,
                      showBottomBorder: true,
                      dataRowHeight: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: theme.primaryColor,
                            width: 3,
                          ),
                          bottom: BorderSide(
                            color: theme.primaryColor,
                            width: 1,
                          ),
                        ),
                      ),
                      columns: _buildDataColumn(context),
                      rows: _buildDataRow(context),
                    )
                  : Image.asset(
                    'assets/phi/no_image.png',
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/phi/no_image.png',
                    fit: BoxFit.cover,
                  ),
              space(height: 20),
              Row(
                children: [
                  Image.asset(
                    'assets/phi/alert.png',
                  ),
                  space(width: 8),
                  Text(
                    '안내사항',
                    style: theme.textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: theme.primaryColor,
                    ),
                  )
                ],
              ),
              space(height: 20),
              Container(
                width: double.infinity,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: theme.textTheme.caption!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7E7E7E),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '건강검진 결과정보는 최근 10년간 국민건강보험공단에서 실시한 일반건강검진, 암건진 및 최근 5년간 실시한 영유아 검진의 정보를 제공합니다.',
                            style: theme.textTheme.caption!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7E7E7E),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '• 본 서비스는 검진기관에서 청구완료되어야 제공 가능합니다.\n\n• 검진일로부터 청구완료까지 30일 소요됩니다.',
                      style: theme.textTheme.caption!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7E7E7E),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  List<DataRow> _buildDataRow(BuildContext context){
    final data = controller.inspectionModel!.resultList!;
    return List.generate(data.length, (index){
      String date = '${data[index].year}.${data[index].checkUpDate.split('/')[0]}.${data[index].checkUpDate.split('/')[1]}'; 
      return DataRow(
        cells: [
          DataCell(
            Center(
              child: Text(
                date,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w400,
                )
              )             
            ),
          ),
           DataCell(
            Center(
              child: Text(
                data[index].location,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w400,
                )
              )             
            ),
          ),
          DataCell(
            Center(
              child: IconButton(
                onPressed: ()=> Get.toNamed(Routes.CHECKUPDETAIL, arguments: data[index]),
                icon: Image.asset(
                  'assets/phi/result.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  List<DataColumn> _buildDataColumn(BuildContext context) {
    return List.generate(
      controller.dataColumn.length,
      (index) => DataColumn(
        label: Container(
          width: controller.dataColumn[index]['width'] as double,
          height: 32,
          decoration: BoxDecoration(
            border: Border(
              right: controller.dataColumn[index]['text'] == '결과' 
                ? BorderSide.none
                : BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
              bottom: BorderSide(
                color: Theme.of(context).primaryColor,
              )
            ),
          ),
          child: Center(
            child: Text(
              controller.dataColumn[index]['text'].toString(),
            ),
          ),
        ),
      ),
    );
  }
}
