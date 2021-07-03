import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/FriendList/components/friend_info_item_list.dart';

class FriendList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendListState();
}

class FriendListState extends State<FriendList> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend List'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 40,
            margin: EdgeInsets.all(10),
            child: TextButton.icon(
              onPressed: () {},
              label: Text('Friend Requests',
                  style: TextStyle(color: Colors.white)),
              icon: Icon(
                Icons.list_outlined,
                color: Colors.white,
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueAccent),
              ),
            ),
          ),
          Expanded(
            child: FriendItemList(),
          )
        ],
      ),
    );
  }
}
