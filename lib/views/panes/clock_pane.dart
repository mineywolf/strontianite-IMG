import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:strontianite/handlers/wallpapers_handler.dart';
import 'package:strontianite/providers/clock_type_provider.dart';
import 'package:strontianite/providers/settings_provider.dart';
import 'package:strontianite/providers/wallpaper_theme_provider.dart';
import 'package:strontianite/providers/wallpapers_provider.dart';
import 'package:strontianite/views/battery_indicator.dart';
import 'package:strontianite/views/clock.dart';
import 'package:strontianite/views/clock_editor.dart';

class ClockPane extends ConsumerWidget {
  const ClockPane({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clockType = ref.watch(clockTypeProvider);
    final displayBatteryIndicator = ref.watch(
      settingsProvider.select((state) => state.displayBatteryIndicator),
    );
    final wallpaper = ref.watch(wallpapersProvider);
    final themeData = ref.watch(wallpaperThemeProvider).value;

    return GestureDetector(
      onLongPress: () {
        debugPrint('long press detected');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClockEditor()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          image: wallpaper.url.isEmpty
              ? null
              : DecorationImage(
                  image: wallpaper.online
                      ? CachedNetworkImageProvider(
                          WallpapersHandler.buildOnlineWallpaperUrl(
                            wallpaper.url,
                          ),
                        )
                      : AssetImage(wallpaper.url),
                  fit: BoxFit.cover,
                ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (displayBatteryIndicator)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 32,
                    height: 16,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [const BatteryIndicator()],
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Clock(clockType: clockType, themeData: themeData),
            ),
          ],
        ),
      ),
    );
  }
}
