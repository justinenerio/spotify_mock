import 'package:flutter/material.dart';

class AlbumTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Music something title", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("This is Author #1", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300))
              ],
            ),
          ),
          Icon(Icons.favorite_border)
        ],
      ),
    );
  }
}