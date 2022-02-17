

int getCriteria(String gubun, String value, String name){

  int? returnValue;

  switch(gubun){
    case '계측검사': 
      returnValue = measurement(value, name);
      break;
    case '요검사':
      returnValue = protein(value);
      break;
    case '혈액검사': 
      returnValue = blood(value, name);
      break;
    case '영상검사':
      returnValue = lungTuberculosis(value);
      break;
    case '골다공증':
      returnValue = osteoporosis(value);
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

int blood(String value, String name){

  double first = double.parse(value);

  switch(name){
    case '혈색소':
      //TODO: 남,녀
      return 0;
    case '공복혈당':
      if(first < 100) return 0;
      else if(first >= 100 && first <= 125) return 1;
      else return 2;
    case '총콜레스테롤':
      if(first < 200) return 0;
      else if(first >= 200 && first <= 239) return 1;
      else return 2;
    case 'HDL콜레스테롤':
      if(first >= 60) return 0;
      else if(first >= 40 && first <= 59) return 1;
      else return 2;
    case '중성지방':
      if(first < 150) return 0;
      else if(first >= 150 && first <= 199) return 1;
      else return 2;
    case 'LDL콜레스테롤':
      if(first < 130) return 0;
      else if(first >= 130 && first <= 139) return 1;
      else return 2;
    case '혈청크레아티닌':     
      if(first <= 1.6) return 0;
      else return 1;
    case '신사구체여과율(GFR)':
      if(first >= 60) return 0;
      else return 1;
    case 'AST (SGOT)':
      if(first <= 40) return 0;
      else if(first >= 41 && first <= 50) return 1;
      else return 2;
    case 'ALT(SGPT)':
      if(first <= 35) return 0;
      else if(first >= 36 && first <= 45) return 1;
      else return 2;
    case '감마지티피(y-GPT)':
      //TODO: 남,녀
      return 0;   
  }
  return 0;
}

int lungTuberculosis(String value){
  if(value.contains('정상')) return 0;
  else return 1;
}

int protein(String value){
  if(value.contains('음성')) return 0;
  else if(value.contains('약양성')) return 1;
  else return 2;
}

int osteoporosis(String value){
  double first = double.parse(value);
  if(first >= -1) return 0;
  else if(first > -2.5 && first <= -1) return 1;
  else return 2;
}
