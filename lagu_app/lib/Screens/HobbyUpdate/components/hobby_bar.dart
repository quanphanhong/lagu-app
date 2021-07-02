import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HobbyBar extends StatelessWidget {
  final DocumentSnapshot snapshot;

  HobbyBar({@required this.snapshot});

  @override
  Widget build(BuildContext context) {
    Map<String, Object> data = snapshot.data();

    return Container(
      height: 50,
      child: Center(
        child: Text(
          data['name'],
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }
}
