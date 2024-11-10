import 'package:flutter/material.dart';
import 'package:juice/screens/main_screen.dart';
import 'package:juice/screens/main_test.dart';
import 'package:juice/theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'juice',
      home: MainScreens(),
      debugShowCheckedModeBanner: false,

      theme: theme(),
    );
  }
}