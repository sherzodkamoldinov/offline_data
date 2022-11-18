// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      code: json['code'] as String? ?? '',
      title: json['title'] as String? ?? '',
      cbPrice: json['cb_price'] as String? ?? '',
      date: json['date'] as String? ?? '',
      nbuBuyPrice: json['nbu_buy_price'] as String? ?? '',
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'code': instance.code,
      'cb_price': instance.cbPrice,
      'nbu_buy_price': instance.nbuBuyPrice,
      'date': instance.date,
    };
