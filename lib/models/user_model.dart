import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? phoneNumber;
  final DateTime? birth;
  UserModel({
    required this.uid,
    required this.phoneNumber,
    required this.birth,
  });

  UserModel copyWith({
    String? uid,
    String? phoneNumber,
    DateTime? birth,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birth: birth ?? this.birth,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
      'birth': birth,
    };
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot ds) {
    return UserModel(
      uid: ds.id,
      phoneNumber: ds['phoneNumber'],
      birth: ds['birth'],
    );
  }
}
