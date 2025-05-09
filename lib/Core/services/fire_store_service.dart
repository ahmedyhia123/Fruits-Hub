import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/Core/services/data_base_service.dart';

class FireStoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String collection,
    required Map<String, dynamic> data,
    String? uid,
  }) async {
    if (uid != null) {
      await firestore.collection(collection).doc(data['uid']).set(data);
    } else {
      await firestore.collection(collection).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String uid,
    required String collection,
  }) async {
    final result = await firestore.collection(collection).doc(uid).get();
    return result.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfDataExists({
    required String uid,
    required String collection,
  })async {
    final result = await firestore.collection(collection).doc(uid).get();
    return result.exists;
     
  }
}
