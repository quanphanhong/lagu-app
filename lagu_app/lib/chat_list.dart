import 'package:flutter/cupertino.dart';
import 'package:lagu_app/chat_item.dart';

class ChatList extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (context, index) => ChatItem(index),
        padding: EdgeInsets.all(10),
        itemCount: 20,
        reverse: true,
        controller: _scrollController,
      )
    );
  }
  
}