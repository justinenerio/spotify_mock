import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_mock/pages/home.dart';
import 'package:spotify_mock/pages/playlist.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  bool _home = true;

  void onPlaylistTap() {
    setState(() {
      _home = false;
    });
  }

  void onBackPress() {
    setState(() {
      _home = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _home
        ? LibraryPageView(onPlaylistTap: onPlaylistTap)
        : PlayListPage(
            onBackPress: onBackPress,
          );
  }
}

class LibraryPageView extends StatefulWidget {
  final Function onPlaylistTap;

  const LibraryPageView({Key key, this.onPlaylistTap}) : super(key: key);

  @override
  _LibraryPageViewState createState() => _LibraryPageViewState();
}

class _LibraryPageViewState extends State<LibraryPageView> {
  bool _isMusic = true;

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
                  primary: true,
                  backgroundColor: Colors.grey[850],
                  floating: false,
                  pinned: false,
                  title: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isMusic = true;
                          });
                        },
                        child: Text("Music",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: _isMusic ? Colors.white : Colors.grey)),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isMusic = false;
                          });
                        },
                        child: Text("Podcasts",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: _isMusic ? Colors.grey : Colors.white)),
                      ),
                    ],
                  ),
                )
              ];
            },
            body: _isMusic
                ? MusicBody(
                    onPlaylistTap: widget.onPlaylistTap,
                  )
                : PodcastBody(),
          ),
        ),
      ),
    );
  }
}

class MusicBody extends StatelessWidget {
  final Function onPlaylistTap;

  const MusicBody({Key key, this.onPlaylistTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.grey[850],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 8,
                ),
                TabBar(
                  indicatorColor: Colors.green,
                  isScrollable: true,
                  tabs: [
                    Container(
                      child: Text("Playlists"),
                      height: 25,
                    ),
                    Container(
                      child: Text("Artist"),
                      height: 25,
                    ),
                    Container(
                      child: Text("Albums"),
                      height: 25,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PlaylistMusic(onPlaylistTap: onPlaylistTap),
            ArtistsMusic(),
            AlbumsMusic()
          ],
        ),
      ),
    );
  }
}

class PlaylistMusic extends StatelessWidget {
  final Function onPlaylistTap;

  const PlaylistMusic({Key key, this.onPlaylistTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        primary: false,
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SearchBarWidget(
              text: "playlist",
            );
          } else if (index == 1) {
            return Container(
              margin: EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                onTap: () {},
                leading: Container(
                  height: 60,
                  width: 60,
                  color: Colors.grey[900],
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                ),
                title: Text("Create Playlist"),
              ),
            );
          } else if (index == 2) {
            return Container(
              margin: EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                onTap: () {},
                leading: Container(
                  height: 60,
                  width: 60,
                  color: Colors.grey[900],
                  child: Center(
                    child: Icon(Icons.favorite),
                  ),
                ),
                title: Text("Liked Songs"),
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(bottom: 2.0),
              child: ListTile(
                onTap: () {
                  onPlaylistTap();
                },
                leading: Container(
                  height: 60,
                  width: 60,
                  color: colorss[Random().nextInt(5)],
                ),
                subtitle: Text("by Test Person"),
                title: Text("Playlist #${index - 2}"),
              ),
            );
          }
        },
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  final String text;

  const SearchBarWidget({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 4, 8, 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(4.0),
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: <Widget>[
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text("Find in $text")
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text("Filters"),
            ),
          )
        ],
      ),
    );
  }
}

class ArtistsMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        primary: false,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SearchBarWidget(
              text: "artists",
            );
          } else if (index == 1) {
            return Container(
              margin: EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                onTap: () {},
                leading: Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(),
                ),
                title: Text("Artist #1"),
              ),
            );
          } else if (index == 2) {
            return Container(
              margin: EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                onTap: () {},
                leading: Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[900],
                    child: Icon(Icons.add),
                  ),
                ),
                title: Text("Add Artists"),
              ),
            );
          } else if (index == 3) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Recommended Artists',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Based on something something text',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(bottom: 2.0),
              child: ListTile(
                onTap: () {},
                leading: Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    backgroundColor: colorss[Random().nextInt(5)],
                  ),
                ),
                subtitle: Text("${Random().nextInt(5)} songs"),
                title: Text("Artist #${index - 2}"),
                trailing: Container(
                  width: 70,
                  height: 30,
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(2.0)),
                  child: Center(
                    child: Text('FOLLOW'),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class AlbumsMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        primary: false,
        itemCount: 13,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SearchBarWidget(
              text: "albums",
            );
          } else if (index >= 1 && index <= 4) {
            return Container(
              margin: EdgeInsets.only(bottom: 2.0),
              child: ListTile(
                onTap: () {},
                leading: Container(
                  height: 60,
                  width: 60,
                  color: colorss[Random().nextInt(5)],
                ),
                title: Text("Album #$index"),
                subtitle: Text("by Artist"),
              ),
            );
          } else if (index == 5) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Recommended albums',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Based on something something text',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.only(bottom: 2.0),
              child: ListTile(
                onTap: () {},
                leading: Container(
                  height: 60,
                  width: 60,
                  color: colorss[Random().nextInt(5)],
                ),
                title: Text("Album #$index"),
                subtitle: Text("by Artist"),
                trailing: Icon(Icons.favorite_border),
              ),
            );
          }
        },
      ),
    );
  }
}

//////////////////////////

class PodcastBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.grey[850],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 8,
                ),
                TabBar(
                  indicatorColor: Colors.green,
                  isScrollable: true,
                  tabs: [
                    Container(
                      child: Text("Episodes"),
                      height: 25,
                    ),
                    Container(
                      child: Text("Downloads"),
                      height: 25,
                    ),
                    Container(
                      child: Text("Shows"),
                      height: 25,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            EpisodesPodcasts(),
            DownloadPodcasts(),
            ShowsPodcasts()
          ],
        ),
      ),
    );
  }
}

class EpisodesPodcasts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        primary: false,
        itemCount: 8,
        itemBuilder: (context, index) {
          return new PodcastTile(
            index: index,
          );
        },
      ),
    );
  }
}

class PodcastTile extends StatelessWidget {
  final int index;
  final bool downloads;
  const PodcastTile({
    Key key,
    this.index,
    this.downloads = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: colorss[Random().nextInt(5)],
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '10$index - Title of podcast',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Album of podcast',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 24,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'JUL ${Random().nextInt(30)} - ${Random().nextInt(60)} MINS',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      Icon(Icons.check),
                      Container(
                        margin: EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: downloads
                                ? Colors.green
                                : Random().nextInt(2) == 0
                                    ? Colors.green
                                    : Colors.transparent,
                            border: Border.all(color: Colors.grey)),
                        child: Icon(Icons.arrow_downward),
                      )
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

class DownloadPodcasts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        primary: false,
        itemCount: 8,
        itemBuilder: (context, index) {
          return new PodcastTile(
            index: index,
            downloads: true,
          );
        },
      ),
    );
  }
}

class ShowsPodcasts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        primary: false,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: colorss[Random().nextInt(5)],
                  borderRadius: BorderRadius.circular(4.0)),
            ),
            title: Text(
              'Podcast show title $index',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              'Updated ${Random().nextInt(30)} Jun 2019 - Podcast Owner',
              style: TextStyle(fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
