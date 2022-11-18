import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:offline_data/data/models/currency/currency_model.dart';
import 'package:offline_data/data/repository/currency_repository.dart';

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
            debugPrint('STORAGE GETTER');
  }

  Future<void> getCurrenciesFromInternet() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var currencies = await _currencyRepository.getCurrencies();
      await _currencyRepository.deleteAllCachedCurrency();
      currencies.forEach(
        (element) async => await _currencyRepository.insertCachedCurrency(
          currencyModel: element,
        ),
      );
      emit(state.copyWith(
          isInternet: true,
          status: FormzStatus.submissionSuccess,
          currencies: currencies));
          debugPrint('INTERNET GETTER');
    } catch (e) {
      emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorText: e.toString()));
    }
  }
}
