import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firebase = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
const threeOverFour = 3 / 4;

Widget space({double height = 0, double width = 0}) {
  return SizedBox(
    height: height,
    width: width,
  );
}
