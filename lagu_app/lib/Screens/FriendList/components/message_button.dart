import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/Messaging/messaging.dart';

class MessageButton extends StatelessWidget {
  final BuildContext parentBuildContext;
  final String userId;
  MessageButton({@required this.parentBuildContext, @required this.userId});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Text(
              'Message',
              style: TextStyle(color: Colors.white),
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blueAccent),
          ),
          onPressed: () {
            Navigator.push(
                parentBuildContext,
                MaterialPageRoute(
                    builder: (context) => Messaging(peerId: userId)));
          },
        ),
      ),
    );
  }
}
