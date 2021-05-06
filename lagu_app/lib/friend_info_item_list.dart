import 'package:flutter/cupertino.dart';
import 'package:lagu_app/friend_info_item.dart';

class FriendItemList extends StatelessWidget {
  final ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) => FriendItem.limited(index),
          itemCount: 20,
          reverse: true,
          controller: _controller,
        )
    );
  }

}