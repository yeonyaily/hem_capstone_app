// import 'dart:convert';

// class DrugModel {
//   DrugModel({
//     required  this.status,
//     required  this.statusSeq,
//     required  this.message,
//     required  this.resultList,
//   });
//   final String status;
//   final int statusSeq;
//   final String message;
//   final List<ResultList> resultList;

//   factory DrugModel.fromJson(Map<String, dynamic> json) => DrugModel(
//     status: json["Status"],
//     statusSeq: json["StatusSeq"],
//     message: json["Message"],
//     resultList: List<ResultList>.from(json["ResultList"].map((x) => ResultList.fromJson(x))),
//   );

//   Map<String, dynamic> toMap() => {
//     "Status": status,
//     "StatusSeq": statusSeq,
//     "Message": message,
//     "ResultList": List<dynamic>.from(resultList.map((x) => x.toMap())),
//   };
// }

// class ResultList {
//   ResultList({
//     required  this.idx,
//     required  this.byungEuiwonYakGukMyung,
//     required  this.jinRyoGaesiIl,
//     required  this.jinRyoHyungTae,
//     required  this.bangMoonIpWonIlsoo,
//     required  this.cheoBangHoiSoo,
//     required  this.tuYakYoYangHoiSoo,
//     required  this.retrieveTreatmentInjectionInformationPersonDetailList,
//   });
//   final String idx;
//   final String byungEuiwonYakGukMyung;
//   final String jinRyoGaesiIl;
//   final String jinRyoHyungTae;
//   final String bangMoonIpWonIlsoo;
//   final String cheoBangHoiSoo;
//   final String tuYakYoYangHoiSoo;
//   final List<RetrieveTreatmentInjectionInformationPersonDetailList> retrieveTreatmentInjectionInformationPersonDetailList;

//   factory ResultList.fromJson(Map<String, dynamic> json) => ResultList(
//     idx: json["Idx"],
//     byungEuiwonYakGukMyung: json["ByungEuiwonYakGukMyung"],
//     jinRyoGaesiIl: json["JinRyoGaesiIl"],
//     jinRyoHyungTae: json["JinRyoHyungTae"],
//     bangMoonIpWonIlsoo: json["BangMoonIpWonIlsoo"],
//     cheoBangHoiSoo: json["CheoBangHoiSoo"],
//     tuYakYoYangHoiSoo: json["TuYakYoYangHoiSoo"],
//     retrieveTreatmentInjectionInformationPersonDetailList: List<RetrieveTreatmentInjectionInformationPersonDetailList>.from(json["RetrieveTreatmentInjectionInformationPersonDetailList"].map((x) => RetrieveTreatmentInjectionInformationPersonDetailList.fromJson(x))),
//   );

//   Map<String, dynamic> toMap() => {
//     "Idx": idx,
//     "ByungEuiwonYakGukMyung": byungEuiwonYakGukMyung,
//     "JinRyoGaesiIl": jinRyoGaesiIl,
//     "JinRyoHyungTae": jinRyoHyungTae,
//     "BangMoonIpWonIlsoo": bangMoonIpWonIlsoo,
//     "CheoBangHoiSoo": cheoBangHoiSoo,
//     "TuYakYoYangHoiSoo": tuYakYoYangHoiSoo,
//     "RetrieveTreatmentInjectionInformationPersonDetailList": List<dynamic>.from(retrieveTreatmentInjectionInformationPersonDetailList.map((x) => x.toMap())),
//   };
// }

// class RetrieveTreatmentInjectionInformationPersonDetailList {
//   RetrieveTreatmentInjectionInformationPersonDetailList({
//     required  this.idx,
//     required  this.jinRyoChoBangIlja,
//     required  this.jinRyoHyungTae,
//     required  this.choBangHoetSoo,
//     required  this.choBangYakPumMyung,
//     required  this.choBangYakPumHyoneung,
//     required  this.tuyakIlSoo,
//     required  this.drugCode,
//     required  this.nameAddr,
//     required  this.retrieveMdsupDtlInfo,
//   });
//   final String idx;
//   final String jinRyoChoBangIlja;
//   final String jinRyoHyungTae;
//   final String choBangHoetSoo;
//   final String choBangYakPumMyung;
//   final String choBangYakPumHyoneung;
//   final String tuyakIlSoo;
//   final String drugCode;
//   final String nameAddr;
//   final List<RetrieveMdsupDtlInfo> retrieveMdsupDtlInfo;

//   factory RetrieveTreatmentInjectionInformationPersonDetailList.fromJson(Map<String, dynamic> json) => RetrieveTreatmentInjectionInformationPersonDetailList(
//     idx: json["Idx"],
//     jinRyoChoBangIlja: json["JinRyoChoBangIlja"],
//     jinRyoHyungTae: json["JinRyoHyungTae"],
//     choBangHoetSoo: json["ChoBangHoetSoo"],
//     choBangYakPumMyung: json["ChoBangYakPumMyung"],
//     choBangYakPumHyoneung: json["ChoBangYakPumHyoneung"],
//     tuyakIlSoo: json["TuyakIlSoo"],
//     drugCode: json["DrugCode"],
//     nameAddr: json["NameAddr"],
//     retrieveMdsupDtlInfo: List<RetrieveMdsupDtlInfo>.from(json["RetrieveMdsupDtlInfo"].map((x)=> RetrieveMdsupDtlInfo.fromJson(x))),
//   );

//   Map<String, dynamic> toMap() => {
//     "Idx": idx,
//     "JinRyoChoBangIlja": jinRyoChoBangIlja,
//     "JinRyoHyungTae": jinRyoHyungTae,
//     "ChoBangHoetSoo": choBangHoetSoo,
//     "ChoBangYakPumMyung": choBangYakPumMyung,
//     "ChoBangYakPumHyoneung": choBangYakPumHyoneung,
//     "TuyakIlSoo": tuyakIlSoo,
//     "DrugCode": drugCode,
//     "NameAddr": nameAddr,
//     "RetrieveMdsupDtlInfo": List<dynamic>.from(retrieveMdsupDtlInfo.map((e) => e.toMap())),
//   };
// }

// class RetrieveMdsupDtlInfo {
//   RetrieveMdsupDtlInfo({
//     required  this.drugCode,
//     required  this.mediPrdcNm,
//     required  this.drugImage,
//     required  this.cmpnInfo,
//     required  this.tmsgGnlSpcd,
//     required  this.snglCmtnYn,
//     required  this.upsoName,
//     required  this.upso1,
//     required  this.fomlCdXplnCnte,
//     required  this.mdctPathXplnCnte,
//     required  this.mohwClsfNoXplnCnte,
//     required  this.atcInfo,
//     required  this.kpicInfo,
//     required  this.efftEftCnte,
//     required  this.usagCpctCnte,
//     required  this.useAtntMttCnte,
//     required  this.cmnTmdcGdncCnte,
//   });
//   final String drugCode;
//   final String mediPrdcNm;
//   final String drugImage;
//   final String cmpnInfo;
//   final String tmsgGnlSpcd;
//   final String snglCmtnYn;
//   final String upsoName;
//   final String upso1;
//   final String fomlCdXplnCnte;
//   final String mdctPathXplnCnte;
//   final String mohwClsfNoXplnCnte;
//   final String atcInfo;
//   final String kpicInfo;
//   final String efftEftCnte;
//   final String usagCpctCnte;
//   final String useAtntMttCnte;
//   final String cmnTmdcGdncCnte;

//   factory RetrieveMdsupDtlInfo.fromJson(Map<String, dynamic> json) {
//     // var decoded = base64.decode(json['DrugImage']);
//     // var drugImage = utf8.decode(decoded);
//     return RetrieveMdsupDtlInfo(
//       drugCode: json["DrugCode"],
//       mediPrdcNm: json["MediPrdcNm"],
//       drugImage: json['DrugImage'],
//       cmpnInfo: json["CmpnInfo"],
//       tmsgGnlSpcd: json["TmsgGnlSpcd"],
//       snglCmtnYn: json["SnglCmtnYn"],
//       upsoName: json["UpsoName"],
//       upso1: json["Upso1"],
//       fomlCdXplnCnte: json["FomlCdXplnCnte"],
//       mdctPathXplnCnte: json["MdctPathXplnCnte"],
//       mohwClsfNoXplnCnte: json["MohwClsfNoXplnCnte"],
//       atcInfo: json["AtcInfo"],
//       kpicInfo: json["KpicInfo"],
//       efftEftCnte: json["EfftEftCnte"],
//       usagCpctCnte: json["UsagCpctCnte"],
//       useAtntMttCnte: json["UseAtntMttCnte"],
//       cmnTmdcGdncCnte: json["CmnTmdcGdncCnte"],
//     );
//   }

//   Map<String, dynamic> toMap() => {
//     "DrugCode": drugCode,
//     "MediPrdcNm": mediPrdcNm,
//     "DrugImage": drugImage,
//     "CmpnInfo": cmpnInfo,
//     "TmsgGnlSpcd": tmsgGnlSpcd,
//     "SnglCmtnYn": snglCmtnYn,
//     "UpsoName": upsoName,
//     "Upso1": upso1,
//     "FomlCdXplnCnte": fomlCdXplnCnte,
//     "MdctPathXplnCnte": mdctPathXplnCnte,
//     "MohwClsfNoXplnCnte": mohwClsfNoXplnCnte,
//     "AtcInfo": atcInfo,
//     "KpicInfo": kpicInfo,
//     "EfftEftCnte": efftEftCnte,
//     "UsagCpctCnte": usagCpctCnte,
//     "UseAtntMttCnte": useAtntMttCnte,
//     "CmnTmdcGdncCnte": cmnTmdcGdncCnte,
//   };
// }
