import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 60;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: new BoxDecoration(
          boxShadow:[new BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
          )]
        ),
        child: Container(
          color: Colors.indigo,
          child: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                  iconSize: 40,
                ),
                margin: const EdgeInsets.only(left: 20),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Robert',
                      textScaleFactor: 2.0,
                      style: TextStyle(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.watch_later,
                          color: Colors.green,
                          size: 15,
                        ),
                        Text(
                          'Online',
                          style: TextStyle(color: Colors.green),
                          textScaleFactor: 1.0,
                        ),
                      ]
                    )
                  ],
                )
              ),
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white
                  ),
                  iconSize: 40,
                ),
                margin: const EdgeInsets.only(right: 20),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}