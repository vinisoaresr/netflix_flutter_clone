import 'package:app/src/home_page/home.dart';
import 'package:app/src/splash_page/splash_page.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Netflix Demo in Flutter',
      theme: ThemeData(
          primarySwatch: Colors.red,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.black)),
      home: const SplashPage(),
      routes: {
        '/splash_screen': (context) => const SplashPage(),
        // '/home_page': (context) => HomePageWidget()
      },
    );
  }
}
