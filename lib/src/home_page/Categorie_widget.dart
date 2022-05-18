import 'package:app/src/services/Model/Items.dart';
import 'package:flutter/material.dart';

class CategorieWidget extends StatefulWidget {
  CategorieWidget({Key? key, required this.category}) : super(key: key);

  final Map<String, dynamic> category;
  List<Items> itemWidget = [];

  @override
  State<CategorieWidget> createState() => _CategorieWidgetState();
}

class _CategorieWidgetState extends State<CategorieWidget> {
  @override
  Widget build(BuildContext context) {
    widget.category['items'].then((items) {
      widget.itemWidget = items;
      setState(() {});
    });
    return Container(
      height: 50,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.category['title'].toString(),
                style: TextStyle(color: Colors.white)),
          ),
          widget.itemWidget.isEmpty
              ? Container(
                  height: 300,
                  width: double.infinity,
                )
              : Container(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(4, 5, 4, 5),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w300${widget.itemWidget[index].poster_path.toString()}',
                              width: 100,
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: widget.itemWidget.length,
                  )),
        ],
      ),
    );
  }
}

// `https://image.tmdb.org/t/p/w300${movie.poster_path}`