import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strontianite/main.dart';
import 'package:strontianite/models/wallpaper_model.dart';

class _WallpapersNotifier extends Notifier<WallpaperModel> {
  @override
  WallpaperModel build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final json = prefs.getString('selected_wallpaper');

    if (json != null) {
      return WallpaperModel.fromJson(jsonDecode(json));
    }

    return WallpaperModel(url: '', online: false);
  }

  Future<void> updateWallpaper(String wallpaper, bool online) async {
    state = WallpaperModel(url: wallpaper, online: online);
    await ref
        .read(sharedPreferencesProvider)
        .setString('selected_wallpaper', jsonEncode(state.toJson()));
  }
}

final wallpapersProvider =
    NotifierProvider<_WallpapersNotifier, WallpaperModel>(
      _WallpapersNotifier.new,
    );
