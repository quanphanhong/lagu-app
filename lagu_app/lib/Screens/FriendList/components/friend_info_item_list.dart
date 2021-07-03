import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Screens/FriendList/components/friend_info_item.dart';
import 'package:lagu_app/const.dart';

class FriendItemList extends StatelessWidget {
  final ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: UserHandler.instance.friendStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(themeColor),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemBuilder: (context, index) => FriendInfoItem(
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
