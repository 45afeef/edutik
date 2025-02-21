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
    Map<String, dynamic>? query,
  }) async {
    Query queryRef = _firestore.collection(collection);

    if (query != null) {
      query.forEach((key, value) {
        queryRef = queryRef.where(key, isEqualTo: value);
      });
    }

    QuerySnapshot querySnapshot = await queryRef.get();

    List<Map<String, dynamic>> output = [];
    for (var doc in querySnapshot.docs) {
      if (doc.exists) {
        var data = doc.data() as Map<String, dynamic>;

        // recording the resource identifier along with the result
        // This is because the resource identifier is stored separate in Firebase from data.
        data['id'] = doc.id;
        output.add(data);
      }
    }
    return output;
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String collection,
    required String documentId,
  }) async {
    DocumentSnapshot doc =
        await _firestore.collection(collection).doc(documentId).get();

    if (!doc.exists) {
      throw DatabaseException(
          "Document can't be found in Firestore: $collection/$documentId");
    }

    var data = doc.data() as Map<String, dynamic>;

    // recording the resource identifier along with the result
    // This is because the resource identifier is stored separate in Firebase from data.
    data['id'] = doc.id;

    return data;
  }

  Future<void> setData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collection).doc(documentId).set(data);
  }

  @override
  Future<void> updateData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collection).doc(documentId).update(data);
  }

  // New methods

  @override
  Future<List<Map<String, dynamic>>> queryData({
    required String collection,
    required Map<String, dynamic> query,
  }) async {
    Query queryRef = _firestore.collection(collection);

    query.forEach((key, value) {
      queryRef = queryRef.where(key, isEqualTo: value);
    });

    QuerySnapshot querySnapshot = await queryRef.get();

    return querySnapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      return data;
    }).toList();
  }

  // @override
  // Future<List<String>> listCollections() async {
  //   List<CollectionReference> collections = await _firestore
  //       .collection('root')
  //       .get()
  //       .then((value) => value.docs.map((e) => e.reference).toList());
  //   return collections.map((collection) => collection.id).toList();
  // }

  // @override
  // Future<void> batchWrite({
  //   required String collection,
  //   required List<Map<String, dynamic>> dataBatch,
  // }) async {
  //   WriteBatch batch = _firestore.batch();

  //   for (var data in dataBatch) {
  //     DocumentReference docRef = _firestore.collection(collection).doc();
  //     batch.set(docRef, data);
  //   }

  //   await batch.commit();
  // }

  // @override
  // Future<int> countDocuments({
  //   required String collection,
  // }) async {
  //   QuerySnapshot querySnapshot = await _firestore.collection(collection).get();
  //   return querySnapshot.size;
  // }
}
