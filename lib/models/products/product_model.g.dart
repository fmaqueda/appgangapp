// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map json) => ProductModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      originalprice: json['originalprice'] as String?,
      realprice: json['realprice'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'originalprice': instance.originalprice,
      'realprice': instance.realprice,
      'description': instance.description,
    };
