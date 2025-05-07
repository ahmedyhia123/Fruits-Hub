import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/Core/services/data_base_service.dart';

class FireStoreService extends DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(String collection, Map<String, dynamic> data) async {
    await firestore.collection(collection).add(data);
    
  }  

}

