<<<<<<< HEAD
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
=======
const String productsTable = "cached_products";

class ProductFields {
  static final List<String> values = [
    /// Add all fields
    id, productId, count, name, price, imageUrl,
  ];
  static const String id = "_id";
  static const String productId = "product_id";
  static const String count = "count";
  static const String name = "name";
  static const String price = "price";
  static const String imageUrl = "image_url";
}

class CachedProduct {
  final int? id;
  final int productId;
  final int count;
  final String name;
  final int price;
  final String imageUrl;

  CachedProduct({
    this.id,
    required this.imageUrl,
    required this.price,
    required this.count,
    required this.name,
    required this.productId,
  });

  CachedProduct copyWith({
    int? id,
    int? productId,
    int? count,
    int? price,
    String? name,
    String? imageUrl,
  }) =>
      CachedProduct(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        count: count ?? this.count,
        price: price ?? this.price,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  static CachedProduct fromJson(Map<String, Object?> json) => CachedProduct(
        id: json[ProductFields.id] as int?,
        productId: json[ProductFields.productId] as int,
        count: json[ProductFields.count] as int,
        price: json[ProductFields.price] as int,
        name: json[ProductFields.name] as String,
        imageUrl: json[ProductFields.imageUrl] as String,
      );

  Map<String, Object?> toJson() => {
        ProductFields.id: id,
        ProductFields.productId: productId,
        ProductFields.count: count,
        ProductFields.price: price,
        ProductFields.name: name,
        ProductFields.imageUrl: imageUrl,
>>>>>>> origin/master
      };

  @override
  String toString() => '''
        ID: $id 
<<<<<<< HEAD
        TITLE $title
        CODE $code
        DATE $date
        CB PRICE $cbPrice
        NBU BUY PRICE $nbuBuyPrice
        NBU CELL PRICE $nbuCellPrice
=======
        COUNT $count
        PRODUCT ID $productId
        PRICE $price
        NAME $name
        IMAGE URL $imageUrl
>>>>>>> origin/master
      ''';
}
