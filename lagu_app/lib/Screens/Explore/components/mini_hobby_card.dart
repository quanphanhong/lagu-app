import 'package:flutter/material.dart';
import 'package:lagu_app/const.dart';

class MiniHobbyCard extends StatelessWidget {
  final String hobbyName;
  MiniHobbyCard({@required this.hobbyName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: themeColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Text(
        hobbyName,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
