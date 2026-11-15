import 'package:json_annotation/json_annotation.dart';

part 'flathub_screenshot_model.g.dart';

@JsonSerializable()
class FlathubScreenshotModel {
  FlathubScreenshotModel({
    required this.width,
    required this.height,
    required this.scale,
    required this.src,
  });

  final String? width;
  final String? height;
  final String? scale;
  final String? src;

  factory FlathubScreenshotModel.fromJson(Map<String, dynamic> json) =>
      _$FlathubScreenshotModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlathubScreenshotModelToJson(this);
}
