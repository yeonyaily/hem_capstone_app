import 'package:public_health_model/public_health_model.dart';

class HealthUtil {
  static InspectionModel? _inspectionModel;
  static DrugModel? _drugModel;
  
  static void setInspectionData(InspectionModel? inspectionModel){
    _inspectionModel = inspectionModel;
  }
  static InspectionModel? getInspectionData(){
    return _inspectionModel;
  }

  static void setMedicalData(DrugModel? drugModel){
    _drugModel = drugModel;
  }
  static DrugModel? getMedicalData(){
    return _drugModel;
  }
}