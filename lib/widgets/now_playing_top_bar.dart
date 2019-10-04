import 'package:flutter/material.dart';

class NowPlayingTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Theme.of(context).dividerColor))),
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.arrow_downward),
            Expanded(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('PLAYING FROM PLAYLIST', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    Text('Webster GayHits', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)
                  ],
                )
              ),
            ),
            Icon(Icons.more_vert)
          ],
        ),
      ),
    );
  }
}
