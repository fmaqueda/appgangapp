import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductModel {
  String? uid;
  final String? name;
  final String? originalprice;
  final String? realprice;
  final String? description;
  //String? imageProductUrl;

  ProductModel({
    required this.uid,
    required this.name,
    //required this.imageProductUrl,
    required this.originalprice,
    required this.realprice,
    required this.description,
  });

  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  /// factory.
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Connect the generated [_$ProductModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
