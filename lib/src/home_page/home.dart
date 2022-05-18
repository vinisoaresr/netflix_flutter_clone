import 'package:app/src/home_page/Categorie_widget.dart';
import 'package:app/src/services/services_api.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    final categories = CategoriesService().fetchCategories();

    return Scaffold(
        body: Container(
            height: 700,
            width: double.infinity,
            color: Colors.black,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 200,
                    child: CategorieWidget(category: categories[index]),
                  );
                },
                itemCount: categories.length)
            // child: Column(
            //   children: categories
            //       .map((category) => CategorieWidget(category: category))
            //       .toList(),
            // ),
            ));
  }
}
