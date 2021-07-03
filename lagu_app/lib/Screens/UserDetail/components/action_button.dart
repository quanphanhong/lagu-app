import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Models/relationship.dart';

class ActionButton extends StatefulWidget {
  final String userId;
  ActionButton({@required this.userId});

  @override
  State<StatefulWidget> createState() => ActionButtonState(userId: userId);
}

class ActionButtonState extends State<ActionButton> {
  String userId;
  String currentUID;
  ActionButtonState({this.userId}) {
    currentUID = new AuthService().getCurrentUID();
  }

  @override
  Widget build(BuildContext context) {
    return currentUID == userId
        ? Container()
        : FutureBuilder(
            future: UserHandler.instance.getRelationship(peerId: userId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data.status) {
                  case Relationship.STATE_ACCEPTED:
                    return TextButton(
                        child: Text('Unfriend'),
                        onPressed: () async {
                          await UserHandler.instance.setRelationshipStatus(
                              peerId: userId,
                              status: Relationship.STATE_DECLINED);
                          setState(() {});
                        });
                  case Relationship.STATE_DECLINED:
                    return TextButton(
                        child: Text('Add friend'),
                        onPressed: () async {
                          await UserHandler.instance.addFriend(peerId: userId);
                          setState(() {});
                        });
                  default:
                    if (snapshot.data.actionUser == currentUID) {
                      return TextButton(
                          child: Text('Pending'), onPressed: () {});
                    } else {
                      return TextButton(
                        child: Text('Accept'),
                        onPressed: () async {
                          await UserHandler.instance.setRelationshipStatus(
                              peerId: userId,
                              status: Relationship.STATE_ACCEPTED);
                          setState(() {});
                        },
                      );
                    }
                }
              } else
                return Container();
            },
          );
  }
}
