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

  @override
  void initState() {
    super.initState();
    fetchNewApps();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),

      itemCount: _feedItems.length,
      itemBuilder: (context, index) {
        final app = _feedItems[index];

        return ListTile(
          title: Text(app.name),
          subtitle: (app.summary != null) ? Text(app.summary!) : null,
          leading: Image.network(app.icon),
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
    );
  }

  Future<void> fetchNewApps() async {
    final items = await MarketUtils.getNewItems();
    setState(() {
      _feedItems = items;
    });
  }
}
