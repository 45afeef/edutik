import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FirebaseService implements DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collection).add(data);
  }

  @override
  Future<void> deleteData({
    required String collection,
    required String documentId,
  }) async {
    await _firestore.collection(collection).doc(documentId).delete();
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData({
    required String collection,
  }) async {
    QuerySnapshot querySnapshot = await _firestore.collection(collection).get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String collection,
    required String documentId,
  }) async {
    DocumentSnapshot doc =
        await _firestore.collection(collection).doc(documentId).get();

    return doc.data() as Map<String, dynamic>;
  }

  @override
  Future<void> updateData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collection).doc(documentId).update(data);
  }
}
