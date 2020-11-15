import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Text(
            'Hello!')); // we pass named arguments hence the argument should be via name not direct data
  }
}
