import 'package:flutter/material.dart';
import 'package:teste/view/home_view.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validador assíncrono Flutter',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: HomeView(),
    );
  }
}
