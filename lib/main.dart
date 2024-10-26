import 'package:flutter/material.dart';
import 'bottom_nav.dart';

void main() {
  runApp(FoodGuideApp());
}

class FoodGuideApp extends StatelessWidget {
  const FoodGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNav(),
    );
  }
}
