import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserModel {
  final String? uid;
  final String? name;
  String? photoUrl;
  final String? email;

  UserModel(
      {required this.uid,
      required this.name,
      required this.photoUrl,
      required this.email});

  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  /// factory.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
