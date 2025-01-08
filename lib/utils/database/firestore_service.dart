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

    return querySnapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;

      // recording the resource identifier along with the result
      // This is because the resource identifier is stored seperate in firebase from data.
      data['id'] = doc.id;

      return data;
    }).toList();
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String collection,
    required String documentId,
  }) async {
    DocumentSnapshot doc =
        await _firestore.collection(collection).doc(documentId).get();

    var data = doc.data() as Map<String, dynamic>;

    // recording the resource identifier along with the result
    // This is because the resource identifier is stored seperate in firebase from data.
    data['id'] = doc.id;

    return data;
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
