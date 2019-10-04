import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_mock/pages/home.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.grey[850],
                  elevation: 0,
                  expandedHeight: 150,
                  floating: false,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: Colors.grey[850],
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Search",
                          style: TextStyle(
                              fontSize: 54, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text("Artist, songs, or podcasts",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          "Your top genres",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(8.0),
                        primary: false,
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: colorss[Random().nextInt(5)],
                                  ),
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Genre #$index",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ),
                          );
                        }),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          "Browse All",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(8.0),
                        primary: false,
                        children: List.generate(9, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: colorss[Random().nextInt(5)],
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Text("Genre #$index",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
