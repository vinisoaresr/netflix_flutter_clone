import 'package:app/src/home_page/Categorie_widget.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget(this.categories, {Key? key}) : super(key: key);

  List<Map<String, dynamic>> categories;
  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: 0,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        unselectedItemColor: Colors.grey[500],
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        iconSize: 24,
        // fixedColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied_alt_sharp),
            label: 'Quick Laugh',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: 'Downloads',
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                Container(
                  // child: widget.categories[0]['items'],

                  child: Image.asset(
                    'assets/netflix_home.jpg',
                    height: 250,
                    width: double.infinity,
                    centerSlice: Rect.largest,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 110,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.7, 1.0],
                      colors: [
                        Color.fromARGB(190, 0, 0, 0),
                        Color.fromARGB(170, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              'Séries',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              'Films',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              'Categories',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 35, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/netflix_logo.png',
                            height: 35,
                            width: 35,
                            alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 35, 15, 0),
                          width: 35,
                          height: 35,
                          alignment: Alignment.topRight,
                          child: const Center(
                              child: Icon(
                            Icons.cast_connected,
                            color: Colors.white,
                          )),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 35, 15, 0),
                            color: Colors.red,
                            width: 35,
                            height: 35,
                            alignment: Alignment.topRight,
                            child: Image.asset('assets/netflix_avatar.png')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: 360,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 200,
                        child:
                            CategorieWidget(category: widget.categories[index]),
                      );
                    },
                    itemCount: widget.categories.length),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
