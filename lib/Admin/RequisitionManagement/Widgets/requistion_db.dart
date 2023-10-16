import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/requistion_model.dart';

class RequisitionDatabase {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'requisitions.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE requisitions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        isApproved INTEGER
      )
    ''');
  }

  Future<List> getRequisitions() async {
    final db = await database;
    List<Map<String, dynamic>> requisitions = await db.query('requisitions');
    return requisitions.map((e) => Requisition.fromMap(e)).toList();
  }

  Future<void> updateRequisition(Requisition requisition) async {
    final db = await database;
    await db.update('requisitions', requisition.toMap(),
        where: 'id = ?', whereArgs: [requisition.id]);
  }

  Future<List> getPendingRequisitions() async {
    final db = await database;
    List<Map<String, dynamic>> pendingRequisitions = await db.query(
      'requisitions',
      where: 'isApproved = ?', // Assuming 1 means approved and 0 means pending
      whereArgs: [0], // Fetch records where isApproved is 0 (pending)
    );
    return pendingRequisitions.map((e) => Requisition.fromMap(e)).toList();
  }
}
