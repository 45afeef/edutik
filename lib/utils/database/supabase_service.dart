import 'package:supabase/supabase.dart';

import 'database_service.dart';

class SupabaseService implements DatabaseService {
  final SupabaseClient _client =
      SupabaseClient('YOUR_SUPABASE_URL', 'YOUR_SUPABASE_KEY');

  @override
  Future<void> addData({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    await _client.from(collection).insert(data);
  }

  @override
  Future<void> deleteData({
    required String collection,
    required String documentId,
  }) async {
    await _client.from(collection).delete().eq('id', documentId);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData({
    required String collection,
  }) async {
    final response = await _client.from(collection).select();

    return response;
    // return List<Map<String, dynamic>>.from(response);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String collection,
    required String documentId,
  }) async {
    final response =
        await _client.from(collection).select().eq('id', documentId).single();

    return response;
  }

  @override
  Future<List<Map<String, dynamic>>> queryData(
      {required String collection, required Map<String, dynamic> query}) {
    // TODO: implement queryData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _client.from(collection).update(data).eq('id', documentId);
  }
}
