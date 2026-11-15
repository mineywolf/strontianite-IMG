import 'package:json_annotation/json_annotation.dart';

part 'flathub_icon_model.g.dart';

@JsonSerializable()
class FlathubIconModel {
  FlathubIconModel({
    required this.url,
    this.width,
    required this.height,
    this.type,
  });

  final String? url;
  final int? width;
  final int? height;
  final String? type;

  factory FlathubIconModel.fromJson(Map<String, dynamic> json) =>
      _$FlathubIconModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlathubIconModelToJson(this);
}
