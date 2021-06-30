import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/FriendList/components/friend_info_item_list.dart';

class FriendList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendListState();
}

class FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                onChanged: (value) {},
                decoration: InputDecoration.collapsed(
                  hintText: 'Search for friends...',
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                iconSize: 40,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          FriendItemList(),
        ],
      ),
    );
  }
}
