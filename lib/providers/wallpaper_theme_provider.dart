import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_3_expressive/material_3_expressive.dart';
import 'package:material_ui/material_ui.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:strontianite/providers/wallpapers_provider.dart';

final wallpaperThemeProvider = FutureProvider<M3EThemeData?>((ref) async {
  final wallpaper = ref.watch(wallpapersProvider);
  if (wallpaper.isEmpty) return null;

  try {
    final palette = await PaletteGenerator.fromImageProvider(
      AssetImage(wallpaper),
    );
    final color = palette.dominantColor?.color ?? Colors.white;

    return ThemeData.estimateBrightnessForColor(color) == Brightness.light
        ? M3EThemeData.light(seedColor: color)
        : M3EThemeData.dark(seedColor: color);
  } catch (_) {
    return null;
  }
});
