import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_3_expressive/material_3_expressive.dart';
import 'package:material_ui/material_ui.dart';
import 'package:strontianite/handlers/wallpapers_handler.dart';
import 'package:strontianite/providers/wallpapers_provider.dart';

class WallpapersSelector extends ConsumerStatefulWidget {
  const WallpapersSelector({super.key});

  @override
  ConsumerState<WallpapersSelector> createState() => _WallpapersSelectorState();
}

class _WallpapersSelectorState extends ConsumerState<WallpapersSelector> {
  late List<String> _featuredWallpapers;
  Map<String, dynamic>? _onlineWallpapers;

  @override
  void initState() {
    super.initState();
    setState(() {
      _featuredWallpapers = WallpapersHandler.getWallpapers();
    });
    _setOnlineWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpapers'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              _buildFeaturedWallpapers(),
              if (_onlineWallpapers != null)
                ..._onlineWallpapers!.entries.map((entry) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      _buildSectionTitle(entry.key),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: entry.value.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 16),
                          itemBuilder: (context, index) {
                            final w = entry.value[index];
                            return SizedBox(
                              width: 300,
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                                clipBehavior: Clip.antiAlias,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        WallpapersHandler.buildOnlineWallpaperUrl(
                                          w,
                                        ),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(16),
                                    onTap: () async {
                                      await ref
                                          .read(wallpapersProvider.notifier)
                                          .updateWallpaper(w, true);
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontVariations: [FontVariation('ROND', 100)],
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Future<void> _setOnlineWallpapers() async {
    final wallpapers = await WallpapersHandler.getOnlineWallpapers();
    setState(() {
      _onlineWallpapers = wallpapers;
    });
  }

  Widget _buildFeaturedWallpapers() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        _buildSectionTitle('Featured'),
        SizedBox(
          height: 200,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _featuredWallpapers.length,
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(
                  width: 300,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior: Clip.antiAlias,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            Icon(M3EIcons.block_rounded),
                            Text(
                              'No wallpaper',
                              style: TextStyle(
                                fontVariations: [FontVariation('ROND', 100)],
                              ),
                            ),
                          ],
                        ),
                        onTap: () async {
                          await ref
                              .read(wallpapersProvider.notifier)
                              .updateWallpaper('', false);
                        },
                      ),
                    ),
                  ),
                );
              }

              final w = _featuredWallpapers[index];
              return SizedBox(
                width: 300,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAlias,
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(w),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () async {
                        await ref
                            .read(wallpapersProvider.notifier)
                            .updateWallpaper(w, false);
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
