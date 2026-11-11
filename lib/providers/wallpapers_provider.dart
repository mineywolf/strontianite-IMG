import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strontianite/main.dart';

class _WallpapersNotifier extends Notifier<String> {
  @override
  String build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final json = prefs.getString('wallpaper');

    if (json != null) {
      return json;
    }

    return '';
  }

  Future<void> updateWallpaper(String wallpaper) async {
    state = wallpaper;
    await ref.read(sharedPreferencesProvider).setString('wallpaper', wallpaper);
  }
}

final wallpapersProvider = NotifierProvider<_WallpapersNotifier, String>(
  _WallpapersNotifier.new,
);
