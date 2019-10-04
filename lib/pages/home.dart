import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spotify_mock/utils/size_config.dart';

class HomePage extends StatelessWidget {
  final List<String> categories = [
    "Recently Played",
    "Your heavy rotation",
    "Keep the vibe going",
    "Your top podcasts",
    "Something something"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.grey[850],
              floating: false,
              pinned: false,
              actions: [
                IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              ],
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => CategorySection(title: categories[index]),
                childCount: categories.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

final List<Color> colorss = [
  Colors.red,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.orange,
  Colors.pinkAccent
];

class CategorySection extends StatelessWidget {
  final String title;

  const CategorySection({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 3.5 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 50,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                2 * SizeConfig.heightMultiplier),
                            color: colorss[Random().nextInt(5)],
                          ),
                          height: 20 * SizeConfig.heightMultiplier,
                          width: 28 * SizeConfig.widthMultiplier,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Text $index',
                          style: TextStyle(
                            fontSize: 2 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
