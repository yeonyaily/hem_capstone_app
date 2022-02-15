import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/controllers/dashboard/navigation_controller.dart';
import 'package:hem_capstone_app/theme/theme.dart';
import 'package:hem_capstone_app/utils/user/health_util.dart';

class TreatHistoryView extends StatelessWidget {
  const TreatHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final data = HealthUtil.getMedicalData();
    final hospital = data!.resultList == null
        ? null
        : data.resultList!
            .where((element) => element.jinRyoHyungTae.contains('외래'));
    final drug = data.resultList == null
        ? null
        : data.resultList!
            .where((element) => element.jinRyoHyungTae.contains('조제'));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: TabBar(
            labelColor: theme.primaryColor,
            unselectedLabelColor: Color(0xffC4C4C4),
            indicatorColor: theme.primaryColor,
            tabs: NavigationController.to.tabBaritem
                .map((data) => Tab(
                      text: data['text'],
                    ))
                .toList(),
          ),
          title: Text(
            '진료 내역',
            style: theme.textTheme.subtitle1!.copyWith(
              color: basicBlack,
            ),
          ),
        ),
        // body: TabBarView(
        //   children: [
        //     SingleChildScrollView(
        //       physics: BouncingScrollPhysics(),
        //       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        //       child: Column(
        //         children: hospital == null
        //           ? [
        //               SvgPicture.asset(
        //                 'assets/phi/no_data.svg',
        //               )
        //             ]
        //           : hospital.map((data){
        //               var idx = data.byungEuiwonYakGukMyung.indexOf('[');
        //               String title = data.byungEuiwonYakGukMyung.substring(0,idx);
        //               return ListTile(
        //                 horizontalTitleGap: 20,
        //                 minLeadingWidth: 24,
        //                 dense:true,
        //                 visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        //                 contentPadding: EdgeInsets.symmetric(vertical: 16),
        //                 leading: Image.asset(
        //                   'assets/phi/health.png',
        //                 ),
        //                 trailing: Icon(
        //                   Icons.arrow_forward_ios_rounded,
        //                 ),
        //                 title: Text(
        //                   title,
        //                   style: theme.textTheme.bodyText1!.copyWith(
        //                     fontWeight: FontWeight.w400,
        //                   ),
        //                 ),
        //                 subtitle: Text(
        //                   '${data.jinRyoHyungTae} | ${data.jinRyoGaesiIl}',
        //                   style: theme.textTheme.bodyText2!.copyWith(
        //                     color: Color(0xff7E7E7E),
        //                   ),
        //                 ),
        //                 onTap: ()=> Get.toNamed('/treatDetail', arguments: data),
        //               );
        //             }).toList(),
        //       ),
        //     ),
        //     SingleChildScrollView(
        //       physics: BouncingScrollPhysics(),
        //       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        //       child: Column(
        //         children: drug == null
        //           ? [
        //               SvgPicture.asset(
        //                 'assets/phi/no_data.svg',
        //               )
        //             ]
        //           : drug.map((data){
        //               var idx = data.byungEuiwonYakGukMyung.indexOf('[');
        //               String title = data.byungEuiwonYakGukMyung.substring(0,idx);
        //               return ListTile(
        //                 horizontalTitleGap: 20,
        //                 minLeadingWidth: 24,
        //                 dense:true,
        //                 visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        //                 contentPadding: EdgeInsets.symmetric(vertical: 16),
        //                 leading: Image.asset(
        //                   'assets/phi/pill.png',
        //                 ),
        //                 trailing: Icon(
        //                   Icons.arrow_forward_ios_rounded,
        //                 ),
        //                 title: Text(
        //                   title,
        //                   style: theme.textTheme.bodyText1!.copyWith(
        //                     fontWeight: FontWeight.w400,
        //                   ),
        //                 ),
        //                 subtitle: Text(
        //                   '${data.jinRyoHyungTae} | ${data.jinRyoGaesiIl}',
        //                   style: theme.textTheme.bodyText2!.copyWith(
        //                     color: Color(0xff7E7E7E),
        //                   ),
        //                 ),
        //                 onTap: ()=> Get.toNamed('/treatDetail', arguments: data),
        //               );
        //             }).toList(),
        //       ),
        //     ),
        //   ],
        // )
      ),
    );
  }
}
