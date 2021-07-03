import 'package:flutter/material.dart';

class FriendGeneralInfoColumn extends StatelessWidget {
  final String nickname;
  final String aboutMe;
  FriendGeneralInfoColumn({@required this.nickname, @required this.aboutMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              nickname != null ? nickname : '',
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
              aboutMe != null ? aboutMe : '',
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
