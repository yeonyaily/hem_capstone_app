import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/services/get_criteria.dart';
import 'package:hem_capstone_app/theme/theme.dart';
import 'package:public_health_model/inspections_model.dart';

class CheckUpGobunScreen extends StatelessWidget {
  const CheckUpGobunScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Map<String,dynamic> data = Get.arguments;
    Inspection inspection = data['inspection'];
    List<Illness>? illness = inspection.illnesses;
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
                    '${inspection.gubun} 결과',
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
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              space(height: 24),
              Text(
                inspection.gubun,
                style: theme.textTheme.subtitle1,
              ),
              space(height: 4),
              Text(
                data['description'],
                style: theme.textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff898A8D),
                ),
              ),
              space(height: 16),
              Divider(
                color: theme.primaryColor,
                thickness: 1,
              ),
              space(height: 16),
              illness == null 
                ? Image.asset(
                    'assets/phi/no_data.png',
                  )
                : illness.length == 0 
                  ? Image.asset(
                    'assets/phi/no_data.png',
                    )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(illness.length, (idx){
                        List<Item>? items = illness[idx].items;
                        return Container(
                          margin: EdgeInsets.only(
                            bottom: illness.length - 1 == idx 
                              ? 0
                              : 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                illness[idx].name,
                                style: theme.textTheme.subtitle2!.copyWith(
                                  color: theme.primaryColor,
                                ),
                              ),
                              space(height: 16),
                              ...List.generate(items!.length, (index) {
                                List<ItemReference>? itemReference = items[index].itemReferences;
                                int? criteria = itemReference!.isNotEmpty && items[index].value.isNotEmpty
                                  ? getCriteria(inspection.gubun, items[index].value, items[index].name)                              
                                  : null;
                                return Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  padding: EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 161,
                                        child: Text(
                                          items[index].name,
                                          style: theme.textTheme.bodyText1!.copyWith(
                                            fontWeight: FontWeight.w700
                                          ),
                                        ),                                  
                                      ),
                                      Container(
                                        width: 100,
                                        child: Text(
                                          items[index].value.length == 0
                                            ? '기록 없음'
                                            : items[index].value.contains('/') 
                                              ? '${items[index].value.split('/')[0]} / ${items[index].value.split('/')[1]}'
                                              : items[index].value,
                                          style: theme.textTheme.bodyText1,
                                        ),
                                      ),
                                      itemReference.length == 0 || items[index].value.isEmpty
                                        ? SizedBox()
                                        : Text(
                                            itemReference[criteria!].name,
                                            style: theme.textTheme.bodyText1!.copyWith(
                                              color: itemReference[criteria].name == '정상(A)' 
                                                ? theme.primaryColor
                                                : itemReference[criteria].name == '정상(B)'
                                                  ? Color(0xffED9F29)
                                                  : Color(0xffDF163F),
                                            ),                                            
                                          )
                                    ],
                                  ),
                                );
                              }),
                            ]
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: idx == illness.length - 1
                                  ? Colors.transparent
                                  : theme.primaryColor
                              )
                            )
                          ),
                        );
                      }),
                    ),
              Divider(
                color: theme.primaryColor,
                thickness: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}