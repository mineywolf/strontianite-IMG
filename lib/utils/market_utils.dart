import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:strontianite/models/flathub_item_model.dart';
import 'package:http/http.dart' as http;

class MarketUtils {
  static Future<List<FlathubItemModel>> getNewItems() async {
    final uri = Uri.parse(
      'https://flathub.org/api/v2/collection/recently-added',
    );
    final response = await http.get(uri);
    debugPrint('Response: ${response.body}');
    final List<dynamic> items = jsonDecode(response.body)['hits'];
    final List<FlathubItemModel> apps = [];
    for (final app in items) {
      apps.add(FlathubItemModel.fromJson(app));
    }
    return apps;
  }

  static 
}
