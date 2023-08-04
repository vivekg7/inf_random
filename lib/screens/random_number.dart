import 'dart:math';

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
  int minValue = 0;
  int maxValue = 100;
  late final TextEditingController _minController;
  late final TextEditingController _maxController;
  int? randomNumber;
  final Random _random = Random(DateTime.now().microsecondsSinceEpoch);
  final List<String> _history = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _minController = TextEditingController(text: minValue.toString());
    _maxController = TextEditingController(text: maxValue.toString());
    _minController.addListener(() {
      int? newMin = int.tryParse(_minController.text);
      if (newMin != null) {
        setState(() {
          minValue = newMin;
          randomNumber = null;
        });
      }
    });
    _maxController.addListener(() {
      int? newMax = int.tryParse(_maxController.text);
      if (newMax != null) {
        setState(() {
          maxValue = newMax;
          randomNumber = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void generateNumber() {
    int nextInt = _random.nextInt(maxValue - minValue) + minValue;
    setState(() {
      if (randomNumber == null) {
        _history.add('Range $minValue to $maxValue');
      }
      randomNumber = nextInt;
      _history.add(randomNumber.toString());
    });
    // Scroll to the bottom with animation.
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      drawer: MainDrawer(index: widget.index),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(
          children: [
            // Min-Max Range TextFields
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _minController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Min Value',
                        hintText: 'Enter Real Number',
                        counterText: '',
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _maxController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Max Value',
                        hintText: 'Enter Real Number',
                        counterText: '',
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                  ),
                ],
              ),
            ),

            // Result and Button
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onPrimary,
                          width: 2,
                        ),
                        // color: Colors.blueGrey[900],
                      ),
                      child: Text(
                        randomNumber?.toString() ?? '--',
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: generateNumber,
                    child: const Text('generate'),
                  )
                ],
              ),
            ),
            // History
            const Text('-- History --'),
            Expanded(
              flex: 2,
              child: ListView.builder(
                controller: _scrollController,
                addAutomaticKeepAlives: true,
                itemCount: _history.length,
                itemBuilder: (context, idx) {
                  return Center(
                    child: Text(_history[idx]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
