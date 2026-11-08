import 'package:material_ui/material_ui.dart';
import 'package:strontianite/handlers/wallpapers_handler.dart';

class WallpapersSelector extends StatefulWidget {
  const WallpapersSelector({super.key});

  @override
  State<WallpapersSelector> createState() => _WallpapersSelectorState();
}

class _WallpapersSelectorState extends State<WallpapersSelector> {
  late List<String> _wallpapers;

  @override
  void initState() {
    super.initState();
    setState(() {
      _wallpapers = WallpapersHandler.getWallpapers();
    });
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            _buildSectionTitle('Featured wallpapers'),
            SizedBox(
              height: 200,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _wallpapers.length,
                separatorBuilder: (context, index) => SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final w = _wallpapers[index];
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
                          onTap: () {},
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
}
