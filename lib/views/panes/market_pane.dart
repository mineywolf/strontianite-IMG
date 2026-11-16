import 'package:material_3_expressive/material_3_expressive.dart';
import 'package:material_ui/material_ui.dart';
import 'package:strontianite/models/flathub_item_model.dart';
import 'package:strontianite/utils/market_utils.dart';
import 'package:strontianite/views/market_app.dart';

class MarketPane extends StatefulWidget {
  const MarketPane({super.key});

  @override
  State<MarketPane> createState() => _MarketPaneState();
}

class _MarketPaneState extends State<MarketPane> {
  List<FlathubItemModel> _feedItems = [];
  final _controller = SearchController();

  @override
  void initState() {
    super.initState();
    _fetchNewApps();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          SearchAnchor(
            searchController: _controller,
            builder: (context, controller) {
              return SearchBar(
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (value) {
                  controller.openView();
                  debugPrint('On changed: $value');
                },
                leading: const Icon(M3EIcons.search_rounded),
                hintText: 'Search apps on Flathub',
              );
            },
            suggestionsBuilder: ((context, controller) async {
              final results = await MarketUtils.searchApps(controller.text);
              return results.map((app) {
                return ListTile(
                  title: Text(app.name ?? 'Unknown app'),
                  leading: app.icon != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Image.network(app.icon!),
                        )
                      : null,
                  onTap: () {
                    controller.closeView(app.name);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MarketApp(flathubItemModel: app),
                      ),
                    );
                  },
                );
              }).toList();
            }),
            viewOnSubmitted: (value) async {
              debugPrint('On submitted: $value');
              _search(value);
              _controller.closeView(value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _feedItems.length,
              itemBuilder: (context, index) {
                final app = _feedItems[index];

                return ListTile(
                  title: Text(app.name ?? 'Unknown app'),
                  subtitle: (app.summary != null) ? Text(app.summary!) : null,
                  leading: app.icon != null
                      ? Image.network(app.icon!)
                      : const Icon(M3EIcons.apps_rounded),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MarketApp(flathubItemModel: app),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchNewApps() async {
    final items = await MarketUtils.getPopularApps();
    setState(() {
      _feedItems = items;
    });
  }

  Future<void> _search(String value) async {
    final results = await MarketUtils.searchApps(value);
    setState(() {
      _feedItems = results;
    });
  }
}
