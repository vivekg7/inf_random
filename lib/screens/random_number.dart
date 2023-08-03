import 'package:flutter/material.dart';
import 'package:inf_random/widgets/main_app_bar.dart';
import 'package:inf_random/widgets/main_drawer.dart';

class RandomNumberScreen extends StatefulWidget {
  final int index;

  const RandomNumberScreen({super.key, required this.index});

  @override
  State<RandomNumberScreen> createState() => _RandomNumberScreenState();
}

class _RandomNumberScreenState extends State<RandomNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: MainDrawer(index: widget.index),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        child: const Text('TODO::'),
      ),
    );
  }
}
