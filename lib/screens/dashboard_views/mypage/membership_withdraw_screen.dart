import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hem_capstone_app/constant/constant.dart';
import 'package:hem_capstone_app/controllers/widgets/radio_controller.dart';

enum unComportable {
  NONE,
  CHANGE,
  NOTSERVICE,
  NOTCONTENT,
  NOTCOMPORTABLE,
  NOTUSE,
  MANYTHING,
  OTHERS
}

class MembershipWithdrawScreen extends StatelessWidget {
  const MembershipWithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(390, 48),
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
                    'assets/phi/arrow_back.png',
                  ),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
                space(width: 32),
                Text(
                  '회원탈퇴',
                  style: theme.textTheme.button!.copyWith(
                    fontSize: 18,
                    color: theme.primaryColor,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffE3E3E3),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 88,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '약묵제이를 이용하시면서 불만족스러웠던 점을\n남겨주시면 더 나은 서비스로 개선하는데\n참고하겠습니다.',
              style: theme.textTheme.bodyText2,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffE3E3E3),
                  width: 1,
                ),
              ),
            ),
          ),
          space(height: 16),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    '서비스 이용 중 불편사항을 선택해 주세요',
                    style: theme.textTheme.bodyText2,
                  ),
                ),
                space(height: 24),
                reasonTile(theme, '아이디 변경 등 탈퇴 후 재가입',unComportable.CHANGE, (_)=> RadioController.to.reason.value = unComportable.CHANGE),
                reasonTile(theme, '회원 혜택 부족', unComportable.NOTSERVICE, (_)=> RadioController.to.reason.value = unComportable.NOTSERVICE),
                reasonTile(theme, '건강 콘텐츠 부족', unComportable.NOTCONTENT, (_)=>RadioController.to.reason.value = unComportable.NOTCONTENT),
                reasonTile(theme, '서비스 이용 불편', unComportable.NOTCOMPORTABLE, (_)=> RadioController.to.reason.value = unComportable.NOTCOMPORTABLE),
                reasonTile(theme, '이용빈도 낮음', unComportable.NOTUSE, (_)=> RadioController.to.reason.value = unComportable.NOTUSE),
                reasonTile(theme, '과도한 광고 메세지 수신', unComportable.MANYTHING, (_)=> RadioController.to.reason.value = unComportable.MANYTHING),
                reasonTile(theme, '기타', unComportable.OTHERS, (_)=>RadioController.to.reason.value = unComportable.OTHERS),
                space(height: 24),
                Container(
                  width: double.infinity,
                  height: 124,
                  padding: EdgeInsets.only(top: 12, left: 12),
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    '내용물 500자 이내로 작성해 주세요.',
                    style: theme.textTheme.caption!.copyWith(
                      color: Color(0xffACACAC),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffF1F1F1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                space(height: 132),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 164,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: ()=> print('취소'), 
                          child: Text(
                            '취소',
                            style: theme.textTheme.caption!.copyWith(
                              color: Color(0xff747474),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            splashFactory: NoSplash.splashFactory,
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            side: BorderSide(
                              color: Color(0xffDDDDDD),
                              width: 1,
                            )
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 164,
                        height: 40,
                        child: ElevatedButton(                          
                          onPressed: ()=> withDrawAuth(),
                          child: Text(
                            '탈퇴',
                            style: theme.textTheme.caption!.copyWith(
                              color: Colors.red,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            splashFactory: NoSplash.splashFactory,
                            primary: Color(0xffEEEEEE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  Future<void> withDrawAuth(){
    return Get.bottomSheet(
      Builder(
        builder: (context) =>
        Container(
          height: 156,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 24, left: 24),                
                child: Text(
                  '[회원탈퇴]',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              space(height: 8),
              Padding(
                padding: EdgeInsets.only(left: 24),         
                child: Text(
                  '정말 탈퇴하시겠습니까?\n탈퇴 후 14일이 경과된 후에 회원가입이 가능합니다.',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 2.0,
                  )
                ),
              ),
              space(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: ()=> Get.back(),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 2.5,
                      height: 40,
                      alignment: Alignment.center,
                      color: Color(0xffF3F3F3),
                      child: Text(
                        '취소',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: ()=> [Get.back(),print('확인')],
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 2.5,
                      height: 40,
                      alignment: Alignment.center,
                      color: Color(0xffF3F3F3),
                      child: Text(
                        '확인',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Color(0xff349EFF),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  ListTile reasonTile(
    ThemeData theme,
    String title,
    unComportable value,
    Function(unComportable?) onChanged,
  ) {
    return ListTile(
      horizontalTitleGap: 10,
      minLeadingWidth: 12,
      dense:true,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Text(
        title,
        style: theme.textTheme.caption
      ),
      leading: SizedBox(
        width: 24,
        height: 24,
        child: Radio(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: value,
          groupValue: RadioController.to.reason.value,
          onChanged: onChanged,
          activeColor: theme.primaryColor,
        ),
      ),
    );
  }
}
