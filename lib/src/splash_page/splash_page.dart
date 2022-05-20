import 'package:app/src/home_page/home.dart';
import 'package:flutter/material.dart';

import '../services/services_api.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    final categories = CategoriesService().fetchCategories();

    Future.delayed(const Duration(seconds: 4)).then((_) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePageWidget(categories)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage(
          'assets/splash_screen.gif',
        ),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
