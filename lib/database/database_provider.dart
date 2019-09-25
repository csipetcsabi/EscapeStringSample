import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:string_sample/content_model.dart';

class DatabaseProvider {

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  static const String DATABASE_NAME = "appData.db";
  static const String TABLE_CONTENT = "content";

  Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;
    _database = await initDB();

    return _database;
  }

  initDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, DATABASE_NAME);

    var exists = await databaseExists(path);

    if(!exists) {
      print("Creating new database from $path");

      //PRE-POPULATED DATABASE - Copy asset database to a usable location
     ByteData data = await rootBundle.load(join("assets", DATABASE_NAME));
     List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
     await new File(path).writeAsBytes(bytes);  
    
    }
    
    return await openDatabase(path);
  }

  Future<List<ContentModel>> getAllContent() async {
    final db = await database;
    var result = await db.query(TABLE_CONTENT);

    print("CONTENT_RESULT: ${result.toString()}");

  return result.isNotEmpty
    ? result.map((json) => ContentModel.fromJson(json)).toList()
    : [];

  }

}