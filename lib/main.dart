import 'package:app/src/home_page/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Demo in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePageWidget(),
    );
  }
}
