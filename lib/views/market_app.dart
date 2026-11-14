import 'package:material_ui/material_ui.dart';
import 'package:strontianite/models/flathub_item_model.dart';

class MarketApp extends StatelessWidget {
  const MarketApp({super.key, required this.flathubItemModel});

  final FlathubItemModel flathubItemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(flathubItemModel.name),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
