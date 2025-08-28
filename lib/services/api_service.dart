import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item_model.dart';

class ApiService {
// Using Fake Store API as placeholder
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Item>> fetchItems() async {
    final resp = await http.get(Uri.parse(baseUrl));
    if (resp.statusCode == 200) {
      final List data = json.decode(resp.body);
      return data.map((e) => Item.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
