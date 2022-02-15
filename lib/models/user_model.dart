import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? phoneNumber;
  final Timestamp? birth;
  final bool? certOnOff;
  UserModel({
    required this.uid,
    required this.phoneNumber,
    required this.birth,
    required this.certOnOff,
  });

  UserModel copyWith({
    String? uid,
    String? phoneNumber,
    Timestamp? birth,
    bool? certOnOff,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birth: birth ?? this.birth,
      certOnOff: certOnOff ?? this.certOnOff,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
      'birth': birth,
      'certOnOff': certOnOff,
    };
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot ds) {
    return UserModel(
      uid: ds.id,
      phoneNumber: ds['phoneNumber'],
      birth: ds['birth'],
      certOnOff: ds['certOnOff'],
    );
  }
}
