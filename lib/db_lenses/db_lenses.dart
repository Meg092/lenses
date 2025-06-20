import 'package:get/get.dart';
import 'package:lenses/db_lenses/lenses_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBLenses extends GetxService {
  late Database dbBase;

  Future<DBLenses> init() async {
    await createLensesDB();
    return this;
  }

  createLensesDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'lenses.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await createLensesTable(db);
    });
  }

  createLensesTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS lenses (id INTEGER PRIMARY KEY, createdTime TEXT, leftImage BLOB, rightImage BLOB, type INTEGER, colorStr TEXT, degree TEXT, diameter TEXT, isOpen INTEGER)');
  }

  insertLenses(LensesEntity entity) async {
    final id = await dbBase.insert('lenses', {
      'createdTime': entity.createdTime.toIso8601String(),
      'leftImage': entity.leftImage,
      'rightImage': entity.rightImage,
      'type': entity.type,
      'colorStr': entity.colorStr,
      'degree': entity.degree,
      'diameter': entity.diameter,
      'isOpen': entity.isOpen,
    });
    return id;
  }

  updateLenses(LensesEntity entity) async {
    await dbBase.update('lenses', {
      'createdTime': entity.createdTime.toIso8601String(),
      'leftImage': entity.leftImage,
      'rightImage': entity.rightImage,
      'type': entity.type,
      'colorStr': entity.colorStr,
      'degree': entity.degree,
      'diameter': entity.diameter,
      'isOpen': entity.isOpen,
    },  where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanLensesData() async {
    await dbBase.delete('lenses');
  }

  Future<List<LensesEntity>> getLensesAllData() async {
    var result = await dbBase.query('lenses', orderBy: 'createdTime DESC');
    return result.map((e) => LensesEntity.fromJson(e)).toList();
  }
}
