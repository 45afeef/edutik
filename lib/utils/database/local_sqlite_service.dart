import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '/src/features/courses/da/repo/batch_request_repository_impl.dart';
import 'database_service.dart';

String _createBatchRequestTableScript =
    '''CREATE TABLE $kBatchRequestsTableName (
    id INTEGER PRIMARY KEY,
    courseId TEXT NOT NULL,
    batchId TEXT NOT NULL,
    studentId TEXT NOT NULL,
    studentName TEXT NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
''';

String _createMcqTableScript = '''CREATE TABLE mcq (
    id INTEGER PRIMARY KEY,
    -- type TEXT NOT NULL CHECK (type IN ('mcq')),
    question TEXT NOT NULL,
    option1 TEXT NOT NULL,
    option2 TEXT NOT NULL,
    option3 TEXT,
    option4 TEXT,
    option5 TEXT,
    option6 TEXT,
    option7 TEXT,
    option8 TEXT,
    option9 TEXT,
    option10 TEXT,
    answer TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
''';

class SqLiteService implements DatabaseService {
  static final SqLiteService _instance = SqLiteService._internal();
  static Database? _database;

  factory SqLiteService() => _instance;

  SqLiteService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  @override
  Future<void> addData({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    final db = await database;
    db.insert(collection, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteAllData({
    required String collection,
  }) async {
    final db = await database;
    db.delete(collection);
  }

  @override
  Future<void> deleteData({
    required String collection,
    required String documentId,
  }) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData({
    required String collection,
    Map<String, dynamic>? query,
  }) async {
    final db = await database;
    return await db.query(collection);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String collection,
    required String documentId,
  }) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> queryData({
    required String collection,
    required Map<String, dynamic> query,
  }) async {
    final db = await database;
    String whereClause = query.keys.map((key) => '$key = ?').join(' AND ');
    List<dynamic> whereArgs = query.values.toList();

    return await db.query(
      collection,
      where: whereClause,
      whereArgs: whereArgs,
    );
  }

  @override
  Future<void> updateData({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    final db = await database;
    await db.update(collection, data, where: 'id = ?', whereArgs: [documentId]);
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'edukit.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create the questions table
        await db.execute(_createMcqTableScript);
        // Create the batch_requests table
        await db.execute(_createBatchRequestTableScript);
      },
    );
  }
}
