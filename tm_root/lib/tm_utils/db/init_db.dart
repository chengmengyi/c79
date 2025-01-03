import 'package:sqflite/sqflite.dart';

class TableName{
  static const String userInfoA="userInfoA";
}

abstract class InitDb{

  Future<Database> onCreate() async => await openDatabase(
      "tm.db",
      version: 1,
      onCreate: (db,version)async{
        db.execute('CREATE TABLE ${TableName.userInfoA} (id INTEGER PRIMARY KEY AUTOINCREMENT, gold INTEGER, level INTEGER, revokeNum INTEGER, resetNum INTEGER, tipsNum INTEGER)');

        // _createVersion2DB(db);
      },
      // onUpgrade: (db,oldVersion,newVersion){
      //   if(newVersion==2){
      //     _createVersion2DB(db);
      //   }
      // }
  );
}