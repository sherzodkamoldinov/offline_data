
const String currencyTable = "currency_table";

class CurrencyFields {
  static final List<String> values = [
    /// Add all fields
    id,title, code, cbPrice, nbuBuyPrice, nbuCellPrice, date,
  ];
  static const String id = "id";
  static const String title = "title";
  static const String code = "code";
  static const String cbPrice = "cb_price";
  static const String nbuBuyPrice = "nbu_buy_price";
  static const String nbuCellPrice = "nbu_cell_price";
  static const String date = "date";


}

class CachedCurrency {
  final int? id;
  final String title;
  final String code;
  final String cbPrice;
  final String nbuBuyPrice;
  final String nbuCellPrice;
  final String date;

  CachedCurrency({
    required this.id,
    required this.title,
    required this.date,
    required this.code,
    required this.nbuBuyPrice,
    required this.cbPrice,
    required this.nbuCellPrice,
  });

  CachedCurrency copyWith({
    int? id,
    String? title,
    String? code,
    String? cbPrice,
    String? date,
    String? nbuBuyPrice,
    String? nbuCellPrice,
  }) =>
      CachedCurrency(
        id: id ?? this.id,
        title: title ?? this.title,
        code: code ?? this.code,
        cbPrice: cbPrice ?? this.cbPrice,
        date: date ?? this.date,
        nbuBuyPrice: nbuBuyPrice ?? this.nbuBuyPrice,
        nbuCellPrice: nbuCellPrice ?? this.nbuCellPrice,
      );

  static CachedCurrency fromJson(Map<String, Object?> json) => CachedCurrency(
        id: json[CurrencyFields.id] as int?,
        title: json[CurrencyFields.title] as String,
        code: json[CurrencyFields.code] as String,
        date: json[CurrencyFields.date] as String,
        cbPrice: json[CurrencyFields.cbPrice] as String,
        nbuCellPrice: json[CurrencyFields.nbuCellPrice] as String,
        nbuBuyPrice: json[CurrencyFields.nbuBuyPrice] as String,
      );

  Map<String, Object?> toJson() => {
    CurrencyFields.id: id,
    CurrencyFields.title: title,
    CurrencyFields.code: code,
    CurrencyFields.date: date,
    CurrencyFields.cbPrice: cbPrice,
    CurrencyFields.nbuCellPrice: nbuCellPrice,
    CurrencyFields.nbuBuyPrice: nbuBuyPrice,

      };

  @override
  String toString() => '''
        ID: $id 
        TITLE $title
        CODE $code
        DATE $date
        CB PRICE $cbPrice
        NBU BUY PRICE $nbuBuyPrice
        NBU CELL PRICE $nbuCellPrice
      ''';
}
