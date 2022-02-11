import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:public_health_model/public_health_model.dart';

class HealthRepository {

  final _healthCollection = FirebaseFirestore.instance.collection('healthData');
  final _medicalCollection = FirebaseFirestore.instance.collection('medicalData');

  final _auth = FirebaseAuth.instance;

  Future<InspectionModel?> findHealthDataByUid(String uid) async {
    try{
      var healthData = await _healthCollection.doc(uid).get();
      if(healthData.data() == null) return null;
      return InspectionModel.fromJson(healthData.data()!);
    } catch (e) {
      return null;
    }
  }

  Future<DrugModel?> findMedicalDataByUid(String uid) async {
     try{
      var medicalData = await _medicalCollection.doc(uid).get();
      if(medicalData.data() == null) return null;
      return DrugModel.fromJson(medicalData.data()!);
    } catch (e) {
      return null;
    }
  }
}