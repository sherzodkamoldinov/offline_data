part of 'currency_cubit.dart';

class CurrencyState extends Equatable {
  const CurrencyState({
    required this.errorText,
    required this.status,
    required this.currencies,
    required this.isInternet,
  });

  final List<CurrencyModel> currencies;
  final String errorText;
  final FormzStatus status;
  final bool isInternet;

  CurrencyState copyWith({
    List<CurrencyModel>? currencies,
    String? errorText,
    FormzStatus? status,
    bool? isInternet,
  }) =>
      CurrencyState(
        currencies: currencies ?? this.currencies,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
        isInternet: isInternet ?? this.isInternet,
      );

  @override
  List<Object?> get props => [currencies, status, errorText, isInternet];
}
