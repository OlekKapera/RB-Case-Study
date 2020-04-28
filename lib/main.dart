import 'package:flutter/material.dart';
import 'records.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep Tracker',
      home: Records(),
    );
  }
}
