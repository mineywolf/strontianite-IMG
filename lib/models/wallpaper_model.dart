class WallpaperModel {
  WallpaperModel({required this.url, required this.online});

  final String url;
  final bool online;

  factory WallpaperModel.fromJson(Map<String, dynamic> json) {
    return WallpaperModel(
      url: json['url'] ?? '',
      online: json['online'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'online': online};
  }
}
