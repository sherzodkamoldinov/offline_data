const String nbuTable = "nbu_table";

class CachedNbuFields {
  static const String id = "_id";
  static const String title = "title";
  static const String code = "code";
  static const String cbPrice = "cb_rice";
  static const String buyPrice = "nbu_buy_price";
  static const String cellPrice = "nbu_cell_price";
  static const String date = "date";
}

class CachedNbu {
  final int? id;
  final String title;
  final String code;
  final String cbPrice;
  final String buyPrice;
  final String cellPrice;
  final String date;

  CachedNbu({
    this.id,
    required this.buyPrice,
    required this.cbPrice,
    required this.cellPrice,
    required this.code,
    required this.date,
    required this.title,
  });

  CachedNbu copyWith({
    int? id,
    String? cbPrice,
    String? buyPrice,
    String? cellPrice,
    String? code,
    String? date,
    String? title,
  }) =>
      CachedNbu(
        buyPrice: buyPrice ?? this.buyPrice,
        cbPrice: cbPrice ?? this.cbPrice,
        cellPrice: cellPrice ?? this.cellPrice,
        code: code ?? this.code,
        date: date ?? this.date,
        title: title ?? this.title,
      );

  static CachedNbu fromJson(Map<String, Object?> json) => CachedNbu(
        id: json[CachedNbuFields.id] as int?,
        buyPrice: json[CachedNbuFields.buyPrice] as String,
        cbPrice: json[CachedNbuFields.cbPrice] as String,
        cellPrice: json[CachedNbuFields.cellPrice] as String,
        code: json[CachedNbuFields.code] as String,
        date: json[CachedNbuFields.date] as String,
        title: json[CachedNbuFields.title] as String,
      );

  Map<String, Object?> toJson() {
    return {
      CachedNbuFields.id: id,
      CachedNbuFields.buyPrice: buyPrice,
      CachedNbuFields.cbPrice: cbPrice,
      CachedNbuFields.cellPrice: cellPrice,
      CachedNbuFields.code: code,
      CachedNbuFields.date: date,
      CachedNbuFields.title: title,
    };
  }

  @override
  String toString() =>
      "ID = $id;  BuyPrice = $buyPrice ;  cbPrice = $cbPrice ;  cellPrice = $cellPrice ; code = $code ; date  = $date ; title  = $title";
}
