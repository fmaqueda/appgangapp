import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductModel {
  String? uid;
  final String? name;
  final String? originalPrice;
  final String? realPrice;
  final String? description;
  String? photoUrl;
  String? productCategory;

  ProductModel({
    this.uid,
    this.name,
    this.photoUrl,
    this.originalPrice,
    this.realPrice,
    this.description,
    this.productCategory,
  });

  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  /// factory.
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Connect the generated [_$ProductModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
