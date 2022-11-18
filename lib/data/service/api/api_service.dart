import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:offline_data/data/models/currency/currency_model.dart';

class ApiService {
  Dio dio = Dio();

  Future<List<CurrencyModel>> getCurrencies() async {
    try {
      Response response =
          await dio.get("https://nbu.uz/en/exchange-rates/json/");

      debugPrint('======DIO GET CURRENCY ISHLADI======');
      return (response.data as List?)
              ?.map((e) => CurrencyModel.fromJson(e))
              .toList() ??
          [];
    } catch (e) {
      throw (e);
    }
  }
}
