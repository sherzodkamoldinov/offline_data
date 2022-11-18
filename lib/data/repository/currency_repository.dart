import 'package:offline_data/data/models/currency/currency_model.dart';
import 'package:offline_data/data/service/api/api_service.dart';

class CurrencyRepository {



  Future<List<CurrencyModel>> getCurrencies() {
    return ApiService().getCurrencies();
  }
}
