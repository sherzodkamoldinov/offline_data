import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:offline_data/data/models/currency/currency_model.dart';
import 'package:offline_data/data/repository/currency_repository.dart';
import 'package:offline_data/data/service/local_data/cached_product.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit({required CurrencyRepository currencyRepository})
      : _currencyRepository = currencyRepository,
        super(const CurrencyState(
          currencies: [],
          errorText: '',
          status: FormzStatus.pure,
          isInternet: false,
        ));

  final CurrencyRepository _currencyRepository;

  Future<void> getCurrenciesFromStorage() async {
    var cachedCurrencies = await _currencyRepository.getAllCachedCurrencies();
    emit(state.copyWith(
        isInternet: false,
        currencies: cachedCurrencies
            .map((e) => CurrencyModel.fromJson(e.toJson()))
            .toList()));
  }

  Future<void> getCurrenciesFromInternet() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var currencies = await _currencyRepository.getCurrencies();
      await _currencyRepository.deleteAllCachedCurrency();
      currencies.forEach(
        (element) async => await _currencyRepository.insertCachedCurrency(
            cachedCurrency: CachedCurrency.fromJson(element.toJson())),
      );
      emit(state.copyWith(
          isInternet: true,
          status: FormzStatus.submissionInProgress,
          currencies: currencies));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
