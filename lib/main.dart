import 'package:flutter/material.dart';
import 'package:inf_random/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inf Random',
      theme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}
