import 'package:freezed_annotation/freezed_annotation.dart';

import '../../do/entities/price.dart';

part 'price_model.freezed.dart';
part 'price_model.g.dart';

@freezed
class PriceModel extends Price with _$PriceModel {
  factory PriceModel({
    required String currency,
    required double amount,
  }) = _PriceModel;

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);
}
