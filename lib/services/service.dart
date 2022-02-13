class Service{
  static String getString(String input, var ch, {bool isSubtile = false}){
    var charIdx = input.indexOf(ch);
    String title = input.substring(0,charIdx);
    String subTitle = input.getSubTitle(charIdx);
    return isSubtile ? subTitle : title;
  }
}

extension E on String {
  String getSubTitle(int n) => substring(n+1,length-1);
}

