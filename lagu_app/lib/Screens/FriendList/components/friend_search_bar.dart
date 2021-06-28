import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController _controller = new TextEditingController();
  final double _height = 60;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
          )
        ]),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.indigo,
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  controller: _controller,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Search for friends...',
                    hintStyle: TextStyle(color: Colors.blueGrey),
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
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_height);
}
