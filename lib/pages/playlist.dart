import 'package:flutter/material.dart';
import 'package:spotify_mock/pages/home.dart';

class PlayListPage extends StatefulWidget {
  final Function onBackPress;

  const PlayListPage({Key key, this.onBackPress}) : super(key: key);
  @override
  _PlayListPageState createState() => _PlayListPageState();
}

const kExpandedHeight = 330.0;

class _PlayListPageState extends State<PlayListPage> {
  ScrollController _scrollController;
  String title = "Playlist Title";
  double _offset = 0;
  bool _downloaded = false;

  double getOpacity(double value) {
    double result;
    int oldRange = (330 - 0);
    if (oldRange == 0)
      result = 0;
    else {
      int newRange = (1 - 0);
      result = (((value - 0) * newRange) / oldRange) + 0;
    }
    return result;
  }

  double getMarginHeight(double value) {
    double result;
    int oldRange = (330 - 0);
    if (oldRange == 0)
      result = 0;
    else {
      double newRange = (kToolbarHeight - 0);
      result = (((value - 0) * newRange) / oldRange) + 0;
    }
    return result;
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _offset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.grey[850],
                    elevation: 0,
                    expandedHeight: kExpandedHeight,
                    floating: false,
                    pinned: true,
                    snap: false,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => widget.onBackPress(),
                    ),
                    actions: <Widget>[Icon(Icons.more_vert)],
                    title: Opacity(
                      opacity: getOpacity(_offset),
                      child: Text(title),
                    ),
                    centerTitle: true,
                    flexibleSpace:  FlexibleSpaceBar(
                            collapseMode: CollapseMode.none,
                            background: Container(
                              color: Colors.grey[850],
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: kToolbarHeight,
                                  ),
                                  Material(
                                    elevation: 4,
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24)),
                                  SizedBox(height: 10),
                                  Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(24),
                                        border:
                                            Border.all(color: Colors.green)),
                                    padding: EdgeInsets.all(4.0),
                                    child: Center(
                                      child: Text(
                                        'FOLLOWING',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'BY SPORTIFY - 3,465,832 FOLLOWERS',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        height: 6,
                                        width: 6,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 4.0),
                                        height: 6,
                                        width: 6,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                ];
              },
              body: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: getMarginHeight(_offset) + 20),
                    child: ListView.builder(
                      primary: true,
                      itemCount: 25,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Downloaded',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Switch(
                                  activeColor: Colors.green,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _downloaded = value;
                                    });
                                  },
                                  value: _downloaded,
                                )
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            child: ListTile(
                              title: Text('Song $index title'),
                              trailing: Icon(Icons.more_vert),
                              subtitle: Row(
                                children: <Widget>[
                                  Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: _downloaded
                                                ? Colors.green
                                                : Colors.grey)),
                                    padding: EdgeInsets.all(2.0),
                                    child: Center(
                                        child: Icon(
                                      Icons.arrow_downward,
                                      size: 12,
                                    )),
                                  ),
                                  SizedBox(width: 5),
                                  Text('Lorem ipsum dolor sit amet',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14))
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Material(
                      elevation: 4,
                      child: Container(
                        margin: EdgeInsets.only(top: getMarginHeight(_offset)),
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(32)),
                        child: Center(
                          child: Text(
                            'SHUFFLE PLAY',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
