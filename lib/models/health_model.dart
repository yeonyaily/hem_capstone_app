// class HelathModel {
//   HelathModel({
//     required this.status,
//     required this.statusSeq,
//     required this.message,
//     required this.resultList,
//   });
//   final String status;
//   final int statusSeq;
//   final String message;
//   final List<ResultList> resultList;

//   factory HelathModel.fromJson(Map<String, dynamic> json) => HelathModel(
//     status: json["Status"],
//     statusSeq: json["StatusSeq"],
//     message: json["Message"],
//     resultList: List<ResultList>.from(json["ResultList"].map((x) => ResultList.fromJson(x))),
//   );

//   Map<String, dynamic> toMap() => {
//       "Status": status,
//       "StatusSeq": statusSeq,
//       "Message": message,
//       "ResultList": List<dynamic>.from(resultList.map((x) => x.toMap())),
//   };
// }

// class ResultList {
//   ResultList({
//     required this.year,
//     required this.checkUpDate,
//     required this.code,
//     required this.location,
//     required this.description,
//     required this.inspections,
//   });
//   final String year;
//   final String checkUpDate;
//   final String code;
//   final String location;
//   final String description;
//   final List<Inspection> inspections;

//   factory ResultList.fromJson(Map<String, dynamic> json) => ResultList(
//     year: json["Year"],
//     checkUpDate: json["CheckUpDate"],
//     code: json["Code"],
//     location: json["Location"],
//     description: json["Description"],
//     inspections: List<Inspection>.from(json["Inspections"].map((x) => Inspection.fromJson(x))),
//   );

//   Map<String, dynamic> toMap() => {
//       "Year": year,
//       "CheckUpDate": checkUpDate,
//       "Code": code,
//       "Location": location,
//       "Description": description,
//       "Inspections": List<dynamic>.from(inspections.map((x) => x.toMap())),
//   };
// }

// class Inspection {
//   Inspection({
//     required this.gubun,
//     required this.illnesses,
//   });
//   final String gubun;
//   final List<Illness> illnesses;

//   factory Inspection.fromJson(Map<String, dynamic> json) => Inspection(
//     gubun: json["Gubun"],
//     illnesses: List<Illness>.from(json["Illnesses"].map((x) => Illness.fromJson(x))),
//   );

//   Map<String, dynamic> toMap() => {
//     "Gubun": gubun,
//     "Illnesses": List<dynamic>.from(illnesses.map((x) => x.toMap())),
//   };
// }

// class Illness {
//   Illness({
//     required this.name,
//     required this.items,
//   });
//   final String name;
//   final List<Item> items;

//   factory Illness.fromJson(Map<String, dynamic> json) => Illness(
//     name: json["Name"],
//     items: List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
//   );
//   Map<String, dynamic> toMap() => {
//     "Name": name,
//     "Items": List<dynamic>.from(items.map((x) => x.toMap())),
//   };
// }

// class Item {
//   Item({
//     required this.name,
//     required this.value,
//     required this.itemReferences,
//   });
//   final String name;
//   final String value;
//   final List<ItemReference> itemReferences;

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//     name: json["Name"],
//     value: json["Value"],
//     itemReferences: List<ItemReference>.from(json["ItemReferences"].map((x) => ItemReference.fromJson(x))),
//   );

//   Map<String, dynamic> toMap() => {
//     "Name": name,
//     "Value": value,
//     "ItemReferences": List<dynamic>.from(itemReferences.map((x) => x.toMap())),
//   };
// }

// class ItemReference {
//   ItemReference({
//     required this.name,
//     required this.value,
//   });
//   String name;
//   String value;

//   factory ItemReference.fromJson(Map<String, dynamic> json) => ItemReference(
//     name: json["Name"],
//     value: json["Value"],
//   );
  
//   Map<String, dynamic> toMap() => {
//     "Name": name,
//     "Value": value,
//   };
// }