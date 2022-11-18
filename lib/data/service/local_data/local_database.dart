import 'package:offline_data/data/service/local_data/cached_product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("currency.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  LocalDatabase._init();

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE $currencyTable (
    ${CurrencyFields.id} $idType,
    ${CurrencyFields.title} $textType,
    ${CurrencyFields.code} $textType,
    ${CurrencyFields.cbPrice} $textType,
    ${CurrencyFields.nbuBuyPrice} $textType,
    ${CurrencyFields.nbuCellPrice} $textType,
    ${CurrencyFields.date} $textType
    )
    ''');
  }

  //-------------------Cached Currencies Table-------------------

  static Future<CachedCurrency> insertCachedProduct(
      CachedCurrency cachedCurrency) async {
    final db = await getInstance.database;
    final id = await db.insert(currencyTable, cachedCurrency.toJson());
    return cachedCurrency.copyWith(id: id);
  }

  // static Future<CachedProduct> getSingleProductById(int id) async {
  //   final db = await getInstance.database;
  //   final results = await db.query(
  //     productsTable,
  //     columns: ProductFields.values,
  //     where: '${ProductFields.id} = ?',
  //     whereArgs: [id],
  //   );
  //   if (results.isNotEmpty) {
  //     return CachedProduct.fromJson(results.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }

  static Future<List<CachedCurrency>> getAllCachedCurrencies() async {
    final db = await getInstance.database;
    const orderBy = "${CurrencyFields.title} ASC";
    final result = await db.query(
      currencyTable,
      orderBy: orderBy,
    );
    return result.map((json) => CachedCurrency.fromJson(json)).toList();
  }

  static Future<int> deleteAllCachedCurrencies() async {
    final db = await getInstance.database;
    return await db.delete(currencyTable);
  }

  static Future<int> deleteCachedCurrencyById(int id) async {
    final db = await getInstance.database;
    var t = await db.delete(currencyTable,
        where: "${CurrencyFields.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

  // static Future<int> updateCachedProduct(
  //     {required int id, required CachedProduct cachedProduct}) async {
  //   Map<String, dynamic> row = {
  //     ProductFields.name: cachedProduct.name,
  //     ProductFields.price: cachedProduct.price,
  //     ProductFields.count: cachedProduct.count,
  //     ProductFields.productId: cachedProduct.productId,
  //     ProductFields.imageUrl: cachedProduct.imageUrl,
  //   };
  //   final db = await getInstance.database;
  //   return db.update(
  //     productsTable,
  //     row,
  //     where: '${ProductFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  // static Future<int> updateCachedProductCount(
  //     {required int id, required int count}) async {
  //   Map<String, dynamic> row = {
  //     ProductFields.count: count,
  //   };
  //   final db = await getInstance.database;
  //   return db.update(
  //     productsTable,
  //     row,
  //     where: '${ProductFields.id} = ?',
  //     whereArgs: [id],
  //   );
  // }

  Future close() async {
    final db = await getInstance.database;
    db.close();
  }
}
