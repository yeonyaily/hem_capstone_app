import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hem_capstone_app/models/user_model.dart';

class AuthRepositroy{

  final _userCollection = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;

  Future<UserModel?> findUserByUid(String uid) async {
    try{
      var user = await _userCollection.where('uid', isEqualTo: uid).get();
      if(user.size == 0) return null;
      return UserModel.fromDocumentSnapshot(user.docs[0]);
    } catch(e) {
      return null;
    }
  }

  String get userUid => _auth.currentUser!.uid;
}