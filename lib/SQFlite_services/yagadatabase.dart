import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/model_data.dart';


class YogaDatabase {

  static final YogaDatabase instance = YogaDatabase._init();
  static Database? _database;

  YogaDatabase._init();

  Future<Database> _initaliZeDB(String Filepath) async{
    final dbPath = await getDatabasesPath();
    final path  = join(dbPath , Filepath);
    return await openDatabase(path ,version: 1 , onCreate: _createDB );
  }

  Future<Database?>  get database  async{
    if(_database ! == null)return _database;
    _database = await _initaliZeDB('YagaStpesDB.db');
    return _database;
  }

  Future _createDB(Database db , int version)async{
    final idType = "INTEGER PRIMERY KEY AUTOINCREMENT";
    final textType = "TEXT NOT NULL";
    final boolType = "BOOLEAN NOT NULL";

    await db.execute(
      '''
      CREATE TABLE ${YagaModels.YogaTable1}(
      ${YagaModels.IDNAME}$idType,
      ${YagaModels.IMAGESNAME}$textType,
      ${YagaModels.IMAGESNAME}$textType,
      ${YagaModels.SECONDORNOT}$boolType,
      ${YagaModels.SECONDOrTime}$boolType,
      ), 
      '''
    );

    await db.execute(
        '''
      CREATE TABLE  ${YagaModels.YogaTable2}(
      ${YagaModels.IDNAME}$idType,
      ${YagaModels.IMAGESNAME}$textType,
      ${YagaModels.IMAGESNAME}$textType,
      ${YagaModels.SECONDORNOT}$boolType,
      ${YagaModels.SECONDOrTime}$boolType,
      ), 
      '''
    );

    await db.execute(
        '''
      CREATE TABLE  ${YagaModels.YogaTable3}(
      ${YagaModels.IDNAME}$idType,
      ${YagaModels.IMAGESNAME}$textType,
      ${YagaModels.IMAGESNAME}$textType,
      ${YagaModels.SECONDORNOT}$boolType,
      ${YagaModels.SECONDOrTime}$boolType,
      ), 
      '''
    );
    await db.execute(
        '''
      CREATE TABLE  ${YagaModels.AllYoga}(
      ${YagaModels.IDNAME}$idType,
      ${YagaModels.YogaWorkOutName}$textType,
      ${YagaModels.BackImg}$textType,
      ${YagaModels.TimeTaken}$textType,
      ${YagaModels.TotleNoOfWork}$textType,
      ${YagaModels.SECONDOrTime}$boolType,
      ), 
      '''
    );
  }

  Future <Yoga?> Insert(Yoga yoga,String TableName)async{
    final db = await instance.database;
    final id = await db!.insert(TableName, yoga.toJson());
    return yoga.copy(id: id);
  }

  Future <AllYoga?> InsertAllYoga(AllYoga allyoga)async{
    final db = await instance.database;
    final id = await db!.insert(YagaModels.YogaTable1, allyoga.toJson());
    return allyoga.copy(id: id);
  }
  Future <List<Yoga>> readyAllYogasec()async{
    final db = await instance.database;
    final orderBy = '${YagaModels.IDNAME} ASC';
    final query_res = await db!.query(YagaModels.YogaTable1 , orderBy:  orderBy);
    return query_res.map((json) => Yoga.fromJson(json)).toList();
  }

  Future <List<Yoga>> readyAllYoga(String TableName)async{
    final db = await instance.database;
    final orderBy = '${YagaModels.IDNAME} ASC';
    final query_res = await db!.query(TableName , orderBy:  orderBy);
    return query_res.map((json) => Yoga.fromJson(json)).toList();
  }

  Future <Yoga?> readOneYoga(int id , String TableName)async{
    final db = await instance.database;
    final map = await db!.query(TableName , columns:  YagaModels.YogaTable1ColumName , where: '${YagaModels.IDNAME} =? ', whereArgs: [id]);
    if(map.isNotEmpty){
      return Yoga.fromJson(map.first);
    }else{
      return null;
    }
  }
}
