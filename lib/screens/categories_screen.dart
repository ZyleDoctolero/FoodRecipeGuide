import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(title: Text('Chicken')),
          ListTile(title: Text('Pasta')),
          ListTile(title: Text('Vegetarian')),
        ],
      ),
    );
  }
}
