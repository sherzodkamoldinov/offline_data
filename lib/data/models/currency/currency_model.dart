import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';


@JsonSerializable(explicitToJson: false)
class CurrencyModel {
  CurrencyModel({
    required this.code,
    required this.title,
    required this.cbPrice,
    required this.date,
    required this.nbuBuyPrice,
  });

  @JsonKey(defaultValue: "", name: "title")
  String title;

  @JsonKey(defaultValue: "", name: "code")
  String code;

  @JsonKey(defaultValue: "", name: "cb_price")
  String cbPrice;

  @JsonKey(defaultValue: "", name: "nbu_buy_price")
  String nbuBuyPrice;
  @JsonKey(defaultValue: "", name: "date")
  String date;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
