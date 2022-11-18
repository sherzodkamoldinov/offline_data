import 'package:offline_data/data/models/currency/currency_model.dart';
import 'package:offline_data/data/service/api/api_service.dart';
import 'package:offline_data/data/service/local_data/cached_product.dart';
import 'package:offline_data/data/service/local_data/cached_user_model.dart';
import 'package:offline_data/data/service/local_data/local_database.dart';
import 'package:sqflite/sqflite.dart';

class CurrencyRepository {
// ---- API SIDE -----
  Future<List<CurrencyModel>> getCurrencies() async =>
      ApiService().getCurrencies();

// ---- STORAGE SIDE ----

  Future<List<CachedNbu>> getAllCachedCurrencies() async =>
      await LocalDataBase.getAllCachedNbus();

  Future<CachedNbu> insertCachedCurrency(
          {required CachedNbuFields cachedCurrency}) async =>
      await LocalDataBase.insertCachedNbuFromAPI(CurrencyModel currecyModel);

  Future<void> deleteAllCachedCurrency() async =>
      await LocalDataBase.deleteAllCachedNbus();
}
