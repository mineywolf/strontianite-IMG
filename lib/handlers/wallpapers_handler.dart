import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class WallpapersHandler {
  static List<String> _wallpapers = [];

  static Future<void> init() async {
    final manifestContent = await AssetManifest.loadFromAssetBundle(rootBundle);
    final assets = manifestContent.listAssets();

    final List<String> wallpaperPaths = assets
        .where((key) => key.contains('assets/images/wallpapers'))
        .toList();

    _wallpapers = wallpaperPaths;
  }

  static List<String> getWallpapers() {
    return _wallpapers;
  }

  static Future<Map<String, dynamic>> getOnlineWallpapers() async {
    final uri = Uri.parse(
      'https://wallpaper-service.ingstudios.dev/wallpapers/get-wallpapers-metadata',
    );
    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(response.body);
  }

  static String buildOnlineWallpaperUrl(String path) {
    final url =
        'https://wallpaper-service.ingstudios.dev/wallpapers/get-wallpaper?path=$path';
    debugPrint('URL: $url');
    return url;
  }
}
