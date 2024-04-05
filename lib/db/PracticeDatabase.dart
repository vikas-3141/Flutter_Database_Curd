import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
class PracticeDatabase
{
  Future<Database> initDatabase()
  async {
    Directory appDocdir= await getApplicationDocumentsDirectory();
    String databasePath= join(appDocdir.path,'database.db');
    return await openDatabase(databasePath);
  }

  Future<bool>copyPasteAssetFileToRoot()
  async {
    Directory documentDirectory=await getApplicationDocumentsDirectory();
    String path= join(documentDirectory.path,'database.db');

    if(FileSystemEntity.typeSync(path)==FileSystemEntityType.notFound)
    {
      ByteData data=await rootBundle.load( join('assets/database','database.db'));
      List<int> bytes=data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      return true;
    }
    else
    {
      return false;
    }
  }

  Future<List<Map<String,dynamic>>> getUser()
  async {
        Database db=await initDatabase();
        var get=db.rawQuery('select * from User');
        return get;
  }

  Future<int> getDelete(int Id)
  async {
    Database db=await initDatabase();
    var delete=db.delete('User',where: 'UserId=?',whereArgs: [Id]);
    return delete;

  }


  Future<int> getInsert({UserName})
  async {
    Database db=await initDatabase();
    Map<String,dynamic> map={'userName':UserName};
    var insert=db.insert('User', map);
    return insert;
  }

  Future<int> getUpdate({UserName,Id})
  async {
    Database db=await initDatabase();
    Map<String,dynamic> map={};
    map["UserName"]=UserName;
    var update=db.update('User', map,where:'UserId=?',whereArgs: [Id]);
    return update;
  }
}