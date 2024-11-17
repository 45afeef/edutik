abstract class DatabaseService {
  Future<void> addData({
    required String collection,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> getData({
    required String collection,
    required String documentId,
  });

  Future<void> updateData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<void> deleteData({
    required String collection,
    required String documentId,
  });

  Future<List<Map<String, dynamic>>> getAllData({
    required String collection,
  });
}
