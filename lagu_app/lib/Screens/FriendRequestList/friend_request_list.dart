import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Screens/FriendRequestList/components/friend_request_item.dart';

class FriendRequestList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendRequestListState();
}

class FriendRequestListState extends State<FriendRequestList> {
  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend Requests'),
        centerTitle: true,
      ),
      body: buildRequestList(context),
    );
  }

  Widget buildRequestList(BuildContext context) {
    return StreamBuilder(
      stream: UserHandler.instance.friendRequestStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Text('There\'s no friend requests to display!'),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, index) => FriendRequestItem(
                snapshot: snapshot.data.docs[index],
                parentBuildContext: context),
            itemCount: snapshot.data.docs.length,
            controller: _controller,
          );
        }
      },
    );
  }
}
