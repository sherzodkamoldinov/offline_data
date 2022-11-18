import 'package:offline_data/data/models/currency/currency_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


import 'cached_user_model.dart';

class LocalDataBase {
  static final LocalDataBase getInstance = LocalDataBase._();

  LocalDataBase._();

  factory LocalDataBase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initializeDB("database.db");
      return _database!;
    }
  }

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE $nbuTable (
    ${CachedNbuFields.id} $idType,
    ${CachedNbuFields.title} $textType,
    ${CachedNbuFields.code} $textType,
    ${CachedNbuFields.cbPrice} $textType,
    ${CachedNbuFields.buyPrice} $textType,
    ${CachedNbuFields.cellPrice} $textType,
    ${CachedNbuFields.date} $textType
    )
    ''');
  }

  //-------------------------------------------Cached Users Table------------------------------------

  static Future<CachedNbu> insertCachedNbuFromAPI(CurrencyModel currencyItem) async {
    final db = await getInstance.database;
    CachedNbu cachedNbu = CachedNbu(
      buyPrice: currencyItem.nbuBuyPrice,
      cbPrice: currencyItem.cbPrice,
      cellPrice: currencyItem.cbPrice,
      code: currencyItem.code,
      date: currencyItem.date,
      title: currencyItem.title,
    );
    final id = await db.insert(nbuTable, cachedNbu.toJson());
    return cachedNbu.copyWith(id: id);
  }

  static Future<List<CachedNbu>> getAllCachedNbus() async {
    final db = await getInstance.database;
    const orderBy = CachedNbuFields.id;
    final result = await db.query(nbuTable, orderBy: orderBy);
    return result.map((json) => CachedNbu.fromJson(json)).toList();
  }

  static Future<int> deleteAllCachedNbus() async {
    final db = await getInstance.database;
    return await db.delete(nbuTable);
  }
}
