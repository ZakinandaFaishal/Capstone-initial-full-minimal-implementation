import 'package:flutter/material.dart';
import '../services/local_storage.dart';
import '../services/api_service.dart';
import '../models/item_model.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<int> _favIds = [];
  List<Item> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    _favIds = LocalStorage.getFavorites();
    final all = await ApiService().fetchItems();
    setState(() {
      _items = all.where((e) => _favIds.contains(e.id)).toList();
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : (_items.isEmpty
              ? Center(child: Text('No favorites yet'))
              : ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, i) {
                    final it = _items[i];
                    return ListTile(
                      leading: Image.network(it.image,
                          width: 56, height: 56, fit: BoxFit.cover),
                      title: Text(it.title),
                      subtitle: Text('\$${it.price}'),
                      onTap: () => Navigator.pushNamed(context, '/detail',
                          arguments: {'item': it}),
                    );
                  },
                )),
    );
  }
}
