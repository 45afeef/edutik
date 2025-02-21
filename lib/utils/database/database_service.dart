class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);

  @override
  String toString() => 'DatabaseException: $message';
}

abstract class DatabaseService {
  Future<void> addData({
    required String collection,
    required Map<String, dynamic> data,
  });

  Future<void> deleteData({
    required String collection,
    required String documentId,
  });

  Future<List<Map<String, dynamic>>> getAllData({
    required String collection,
    Map<String, dynamic>? query,
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

  // New methods
  Future<List<Map<String, dynamic>>> queryData({
    required String collection,
    required Map<String, dynamic> query,
  });

  // Future<void> batchWrite({
  //   required String collection,
  //   required List<Map<String, dynamic>> dataBatch,
  // });

  // Future<int> countDocuments({
  //   required String collection,
  // });

  // Future<List<String>> listCollections();
}
