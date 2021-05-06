import 'package:flutter/cupertino.dart';
import 'package:lagu_app/friend_info_item_list.dart';
import 'package:lagu_app/friend_search_bar.dart';
import 'package:mvc_application/view.dart';

class FriendList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendListState();
}

class FriendListState extends StateMVC<FriendList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friend List',
      home: Scaffold(
        appBar: FriendSearchBar(),
        body: Stack(
          children: <Widget>[
            FriendItemList(),
          ],
        ),
      ),
    );
  }
}