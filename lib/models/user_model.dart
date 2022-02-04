import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? phoneNumber;
  UserModel({
    required this.uid,
    required this.phoneNumber,
  });

  UserModel copyWith({
    String? uid,
    String? phoneNumber,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot ds) {
    return UserModel(
      uid: ds.id,
      phoneNumber: ds['phoneNumber'],
    );
  }
}
