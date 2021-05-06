import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagingInput extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1),
              child: new IconButton(
                  icon: new Icon(Icons.face),
              ),
            ),
            color: Colors.white,
          ),
          Flexible(
              child: Container(
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15
                  ),
                  controller: _controller,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Type a message',
                    hintStyle: TextStyle(color: Colors.grey)
                  ),
                ),
              )
          ),
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1),
              child: new IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.blue,
                ),
              ),
            ),
            color: Colors.white,
          )
        ],
      ),
    );
  }
  
}