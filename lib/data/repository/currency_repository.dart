import 'package:offline_data/data/models/currency/currency_model.dart';
import 'package:offline_data/data/service/api/api_service.dart';
import 'package:offline_data/data/service/local_data/local_database.dart';

class CurrencyRepository {
// ---- API SIDE -----
  Future<List<CurrencyModel>> getCurrencies() {
    return ApiService().getCurrencies();
  }

// ---- STORAGE SIDE ----

  Future<List<CachedCurrency>> getAllCachedCurrencies() async =>
    await LocalDatabase.getAllCachedCurrencies();
  
}
