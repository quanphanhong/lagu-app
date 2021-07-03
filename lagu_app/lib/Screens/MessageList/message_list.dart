import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Models/message.dart';
import 'package:lagu_app/Screens/Messaging/messaging.dart';

import 'package:lagu_app/const.dart';

class MessageList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  String currentUserId = '';
  final ScrollController listScrollController = ScrollController();

  int _limit = 20;
  int _limitIncrement = 20;
  bool isLoading = false;
  List<Choice> choices = const <Choice>[
    const Choice(title: 'Settings', icon: Icons.settings),
    const Choice(title: 'Log out', icon: Icons.exit_to_app),
  ];

  @override
  void initState() {
    super.initState();
    listScrollController.addListener(scrollListener);
    setState(() => currentUserId = AuthService().getCurrentUID());
  }

  void scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('relationships')
            .where('lastTimestamp', isGreaterThanOrEqualTo: 0)
            .orderBy('lastTimestamp', descending: true)
            .snapshots(),
        builder: (relationshipContext, relationshipSnapshot) {
          if (!relationshipSnapshot.hasData) {
            return Center(child: Text('There\'s no messages!'));
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, index) {
                DocumentSnapshot relationshipDoc =
                    relationshipSnapshot.data.docs[index];
                if (relationshipDoc.id.contains(currentUserId)) {
                  return StreamBuilder(
                      stream: relationshipDoc.id.contains(currentUserId, 0)
                          ? FirebaseFirestore.instance
                              .collection('users')
                              .where(FieldPath.documentId,
                                  isEqualTo: relationshipDoc['user_2'])
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('users')
                              .where(FieldPath.documentId,
                                  isEqualTo: relationshipDoc['user_1'])
                              .snapshots(),
                      builder: (userContext, userSnapshot) {
                        if (userSnapshot.hasData) {
                          return buildItem(context, relationshipDoc,
                              userSnapshot.data.docs[0]);
                        } else
                          return Container();
                      });
                } else {
                  return Container();
                }
              },
              itemCount: relationshipSnapshot.data.docs.length,
              controller: listScrollController,
            );
          }
        },
      ),
    );
  }

  void onItemMenuPress(Choice choice) {}

  String getDisplayContent(int messageType, String messageContent) {
    switch (messageType) {
      case Message.TYPE_TEXT:
        return messageContent;
      case Message.TYPE_IMAGE:
        return '[Image]';
      case Message.TYPE_GIF:
        return '[GIF]';
      default:
        return 'Sticker';
    }
  }

  Widget buildItem(BuildContext context, DocumentSnapshot relationshipDocument,
      DocumentSnapshot userDocument) {
    Map<String, Object> relationshipData = relationshipDocument.data();
    Map<String, Object> userData = userDocument.data();

    return Container(
      // ignore: deprecated_member_use
      child: FlatButton(
        child: Row(
          children: <Widget>[
            Material(
              child: userData['profilePicture'] != null
                  ? CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        child: CircularProgressIndicator(
                          strokeWidth: 1.0,
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                        width: 50.0,
                        height: 50.0,
                        padding: EdgeInsets.all(15.0),
                      ),
                      imageUrl: userData['profilePicture'],
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.account_circle,
                      size: 50.0,
                      color: greyColor,
                    ),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              clipBehavior: Clip.hardEdge,
            ),
            Flexible(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        userData['nickname'],
                        style: TextStyle(color: primaryColor),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                    ),
                    Container(
                      child: Text(
                        getDisplayContent(relationshipData['lastMessageType'],
                            relationshipData['lastMessage']),
                        style: TextStyle(color: primaryColor),
                      ),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    )
                  ],
                ),
                margin: EdgeInsets.only(left: 20.0),
              ),
            ),
          ],
        ),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Messaging(peerId: userDocument.id)));
        },
        color: greyColor2,
        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
