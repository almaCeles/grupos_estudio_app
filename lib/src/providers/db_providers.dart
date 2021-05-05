import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider{
   
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async{
     Directory documentsDirectory = await getApplicationDocumentsDirectory();
     final path= join(documentsDirectory.path, 'GruposDb.db');
     print(path);

     //crear base de datos
     return await openDatabase(
       path,
       version: 1,
       onOpen: (db){},
       onCreate: (Database db, int version ) async{
         await db.execute('''
          CREATE TABLE usuarios(
            id INTEGER PRIMARY KEY       NOT NULL,
            nombre         TEXT  NOT NULL,
            apellido       TEXT  NOT NULL,
            email          TEXT  NOT NULL,
            carrera        TEXT  NOT NULL
          );

          CREATE TABLE cusos(
            id INTEGER PRIMARY KEY       NOT NULL,
            nombre         TEXT      NOT NULL,
            admin          BOOLEAN   NOT NULL,
            fk_usuario     INTEGER       NOT NULL,
            FOREIGN KEY(fk_usuario) REFERENCES usuarios(id) 
          );

         ''');
       }
       );
  }
  /*Future<int>( ModelUsuario nuevoUsuario) async{
      final db= await database;
      final res= await db.insert('GruposDb', nuevoUsuario.toJson());
      return res;
  }*/
}