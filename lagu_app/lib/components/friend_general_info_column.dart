import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FriendGeneralInfoColumn extends StatelessWidget {
  final DocumentSnapshot snapshot;
  FriendGeneralInfoColumn({@required this.snapshot});

  @override
  Widget build(BuildContext context) {
    Map<String, Object> data = snapshot.data();

    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              data['nickname'],
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(bottom: 5),
          ),
          Container(
            child: Text(
              data['aboutMe'],
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
