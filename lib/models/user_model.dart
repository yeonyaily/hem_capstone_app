import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? name;
  final String? validDate;
  final String? phoneNumber;
  final Timestamp? birth;
  final bool? certOnOff;
  final String? identityNum;
  final String? gender;
  UserModel({
    required this.name,
    required this.validDate,
    required this.uid,
    required this.phoneNumber,
    required this.birth,
    required this.certOnOff,
    required this.identityNum,
    required this.gender,
  });

  UserModel copyWith({
    String? uid,
    String? phoneNumber,
    Timestamp? birth,
    bool? certOnOff,
    String? identityNum,
    String? name,
    String? gender,
    String? validDate,
  }) {
    return UserModel(
      name: name ?? this.name,
      validDate: validDate ?? this.validDate,
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birth: birth ?? this.birth,
      certOnOff: certOnOff ?? this.certOnOff,
      identityNum: identityNum ?? this.identityNum,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'validDate': validDate,
      'uid': uid,
      'phoneNumber': phoneNumber,
      'birth': birth,
      'certOnOff': certOnOff,
      'identityNum': identityNum,
      'gender': gender,
    };
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot ds) {
    return UserModel(
      uid: ds.id,
      phoneNumber: ds['phoneNumber'],
      birth: ds['birth'],
      certOnOff: ds['certOnOff'],
      validDate: ds['validDate'],
      name: ds['name'],
      identityNum: ds['identityNum'],
      gender: ds['gender'],
    );
  }
}
