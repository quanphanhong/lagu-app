import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/const.dart';

class FriendItemList extends StatelessWidget {
  final ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(themeColor),
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, index) =>
                  buildItem(context, snapshot.data.docs[index]),
              itemCount: snapshot.data.docs.length,
              controller: _controller,
            );
          }
        },
      ),
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot snapshot) {
    Map<String, Object> data = snapshot.data();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(50.0)),
                  border: Border.all(color: const Color(0xFF28324E)),
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: (data['profilePicture'] != null &&
                              data['profilePicture'] != '')
                          ? new NetworkImage(
                              data['profilePicture'],
                            )
                          : new AssetImage(
                              'assets/images/default-avatar.png'))),
              width: 60,
              height: 60,
            ),
            Container(
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
                    ])),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Message',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
