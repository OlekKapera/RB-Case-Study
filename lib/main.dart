import 'package:flutter/material.dart';
import 'package:rbcasestudy/pages/add_record.dart';
import 'package:rbcasestudy/pages/records.dart';

void main() {
  runApp(MaterialApp(
    title: 'Sleep Tracker',
    initialRoute: '/',
    routes: {
      '/': (context) => Records(),
      '/add_record': (context) => AddRecord(),
    },
  ));
}