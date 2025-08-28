import 'package:flutter/material.dart';
import '../models/item_model.dart';

class DetailScreen extends StatelessWidget {
  final Item item;
  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.image,
                height: 200, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 12),
            Text(item.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 6),
            Text('\$${item.price}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Expanded(
                child: SingleChildScrollView(child: Text(item.description)))
          ],
        ),
      ),
    );
  }
}
