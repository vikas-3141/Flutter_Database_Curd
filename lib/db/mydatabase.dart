import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';

class mydatabase
{
    Future<Database> initDatabase()
    async {
        Directory appDocdir= await getApplicationDocumentsDirectory();
        String databasePath= join(appDocdir.path,'database1.db');
        return await openDatabase(databasePath);
    }

    Future<bool>copyPasteAssetFileToRoot()
    async {
        Directory documentDirectory=await getApplicationDocumentsDirectory();
        String path= join(documentDirectory.path,'database1.db');

        if(FileSystemEntity.typeSync(path)==FileSystemEntityType.notFound)
        {
            ByteData data=await rootBundle.load( join('assets/database','database1.db'));
            List<int> bytes=data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
            await File(path).writeAsBytes(bytes);
            return true;
        }
        else
        {
            return false;
        }
    }

    Future<List> getUser()
    async {
        Database db=await initDatabase();
        var list=await db.rawQuery('select * from User');
        return list;
    }


    Future<int> getDelete(int id)
    async {
        Database db=await initDatabase();
        var list=await db.delete('User',where: 'id=?',whereArgs: [id]);
        return list;
    }

    Future<int> insert({UserName})
    async {
            Database db=await initDatabase();
            Map<String,dynamic> map={};
            map['UserName']=UserName;
            var ins=db.insert('User', map);
            return ins;
    }

    Future<int> update({UserName,Id})
    async{
        Database db=await initDatabase();
        Map<String,dynamic> map={'UserName':UserName};
        var up=db.update('User', map,where: 'id= ?',whereArgs:[Id] );
        return up;
    }
}
