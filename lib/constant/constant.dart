import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firebase = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;


Widget space({double height = 0, double width = 0}){
  return SizedBox(
    height: height,
    width: width,
  );
}