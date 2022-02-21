import 'package:json_annotation/json_annotation.dart';
part 'video_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class VideoModel {
  String? id;
  String? name;
  String? subtitle;
  String? urlImage;
  String? urlVid;

  VideoModel({
    this.id,
    this.name,
    this.subtitle,
    this.urlImage,
    this.urlVid,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
