import 'package:flutter/services.dart';

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
}
