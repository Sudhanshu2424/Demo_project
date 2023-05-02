import 'package:demo_project/responseDR.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'Response.db';

  static Future<Database> _getDB() async{
    return openDatabase(join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async =>
      await db.execute("CREATE TABLE Response(ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,data TEXT NOT NULL);"),
      version: _version
    );
  }

  static Future<int> addResponse(ResponseDR response) async{
    final db = await _getDB();
    return await db.insert('Response', response.toJson());
  }

  static Future<List<ResponseDR>?> getAllResponse() async{
    final db = await _getDB();
    final List<Map<String,dynamic>> allData = await db.query("Response");

    if(allData.isEmpty) return null;
    return List.generate(allData.length, (index) => ResponseDR.fromJson(allData[index]));
  }

}