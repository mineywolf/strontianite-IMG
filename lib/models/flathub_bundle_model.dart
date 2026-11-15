import 'package:json_annotation/json_annotation.dart';

part 'flathub_bundle_model.g.dart';

@JsonSerializable()
class FlathubBundleModel {
  FlathubBundleModel({
    required this.value,
    required this.sdk,
    required this.type,
    required this.runtime,
  });

  final String value;
  final String sdk;
  final String type;
  final String runtime;

  factory FlathubBundleModel.fromJson(Map<String, dynamic> json) =>
      _$FlathubBundleModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlathubBundleModelToJson(this);
}
