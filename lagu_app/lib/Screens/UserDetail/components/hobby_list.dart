import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Models/hobby.dart';
import 'package:lagu_app/Screens/UserDetail/components/hobby_card.dart';
import 'package:flutter/cupertino.dart';

class HobbyList extends StatefulWidget {
  final String userId;
  HobbyList({@required this.userId});

  @override
  State<StatefulWidget> createState() => HobbyListState(userId: userId);
}

class HobbyListState extends State<HobbyList> {
  List<Hobby> hobbies = new List<Hobby>.empty(growable: true);
  final String userId;

  HobbyListState({this.userId}) {
    UserHandler.instance
        .getHobbyList(userId)
        .then((hobbyList) => setState(() => hobbies = hobbyList));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 35.0,
          maxHeight: 200.0,
        ),
        child: Row(
          children: <Widget>[Expanded(child: buildHobbyList())],
        ),
      ),
    );
  }

  Widget buildHobbyList() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: hobbies.length,
        itemBuilder: (BuildContext context, int index) =>
            buildItem(hobbies[index]));
  }

  Widget buildItem(item) => HobbyCard(item: item, onClicked: () => {});
}
