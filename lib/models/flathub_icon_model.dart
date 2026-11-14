import 'package:json_annotation/json_annotation.dart';

part 'flathub_icon_model.g.dart';

@JsonSerializable()
class FlathubIconModel {
  FlathubIconModel({
    required this.url,
    required this.height,
    required this.scale,
    required this.src,
  });

  final String url;
  final String height;
  final String scale;
  final String src;

  factory FlathubIconModel.fromJson(Map<String, dynamic> json) =>
      _$FlathubIconModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlathubIconModelToJson(this);
}
