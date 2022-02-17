

int getCriteria(String gubun, String value, String name){

  int? returnValue;

  switch(gubun){
    case '계측검사': 
      returnValue = measurement(value, name);
      break;
    case '요검사':
      break;
    case '혈액검사':
      break;
    case '영상검사':
      break;
    case '골다공증':
      break;
  }
  return returnValue!;
}

int measurement(String value, String name){
  var first, second;
  if(name == '혈압(최고/최저)'){
    first = double.parse(value.split('/')[0]);
    second = double.parse(value.split('/')[1]);
  } else {
    first = double.tryParse(value);
  }
  switch(name){
    case '허리둘레':
      return 0;
     //TODO: 남자: 90 이상, 여자 85 이상 질환의심, 미만은 정상
    case '체질량지수':
      if(first >= 18.5 && first <= 24.9) return 0;
      else if((first >= 25 && first <= 29.9) || first < 18.5) return 1;
      else return 2;
    case '혈압(최고/최저)':
      if(first < 120 && second! < 80) return 0;
      else if((first >= 120 && first < 140) || (second! >= 80 && second < 90)) return 1;
      else return 2;
  }
  return 0;
}