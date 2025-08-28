import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/item_model.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../services/local_storage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Item>> _itemsFuture;
  List<int> _favorites = [];

  @override
  void initState() {
    super.initState();
    _itemsFuture = ApiService().fetchItems();
    _favorites = LocalStorage.getFavorites();
  }

  void _toggleFavorite(int id) async {
    setState(() {
      if (_favorites.contains(id))
        _favorites.remove(id);
      else
        _favorites.add(id);
    });
    await LocalStorage.saveFavorites(_favorites);
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
// logo placeholder
          FlutterLogo(size: 28),
          SizedBox(width: 8),
          Text('Recipe Catalog')
        ]),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(context, '/settings')),
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () => Navigator.pushNamed(context, '/favorites')),
        ],
      ),
      body: FutureBuilder<List<Item>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Gagal memuat data'));
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final it = items[i];
              final isFav = _favorites.contains(it.id);
              return ListTile(
                leading: Image.network(it.image,
                    width: 56, height: 56, fit: BoxFit.cover),
                title: Text(it.title,
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text('\$${it.price}'),
                trailing: IconButton(
                    icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                    onPressed: () => _toggleFavorite(it.id)),
                onTap: () => Navigator.pushNamed(context, '/detail',
                    arguments: {'item': it}),
              );
            },
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text(appState.userEmail ?? 'Guest')),
            ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () => Navigator.pop(context)),
            ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
                onTap: () => Navigator.pushNamed(context, '/settings')),
            ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onTap: () {
                  appState.logout();
                  Navigator.pushReplacementNamed(context, '/');
                }),
          ],
        ),
      ),
    );
  }
}
