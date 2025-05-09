abstract class DataBaseService {
  Future<void> addData({
    required String collection,
    required Map<String, dynamic> data,
    String? uid,
  });
  Future<Map<String, dynamic>> getData({
    required String uid,
    required String collection,
  });
  Future<bool> checkIfDataExists({
    required String uid,
    required String collection,
  });
}
