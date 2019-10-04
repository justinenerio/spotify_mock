import 'package:flutter/material.dart';
import 'package:spotify_mock/pages/home.dart';
import 'package:spotify_mock/pages/library.dart';
import 'package:spotify_mock/pages/search.dart';
import 'package:spotify_mock/utils/size_config.dart';
import 'package:spotify_mock/widgets/now_playing_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                  fontFamily: 'ProductSans',
                  primarySwatch: Colors.blue,
                  brightness: Brightness.dark,
                  accentColor: Colors.white),
              home: MyHomePage(),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isPlaying = true;
  int _selectedIndex = 0;
  bool _isPaused = false;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    // PlayListPage(),
    SearchPage(),
    LibraryPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (_isPlaying)
            NowPlayingBar(
              isPaused: _isPaused,
              onTapped: () {
                setState(() {
                  _isPaused = !_isPaused;
                });
              },
            ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                title: Text('Your library'),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ],
      ),
    );
  }
}
