abstract class DataBaseService {
  Future<void> addData({required String collection, required Map<String, dynamic> data});
}