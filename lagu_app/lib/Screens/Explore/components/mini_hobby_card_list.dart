import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/hobby_handler.dart';
import 'package:lagu_app/Models/hobby.dart';
import 'package:lagu_app/Screens/Explore/components/mini_hobby_card.dart';

class MiniHobbyCardList extends StatefulWidget {
  final String userId;
  MiniHobbyCardList({@required this.userId});

  @override
  State<StatefulWidget> createState() => MiniHobbyCardListState(userId: userId);
}

class MiniHobbyCardListState extends State<MiniHobbyCardList> {
  List<Hobby> hobbyList = new List<Hobby>.empty(growable: true);
  final String userId;

  MiniHobbyCardListState({@required this.userId}) {
    HobbyHandler.instance
        .getHobbyList(userId)
        .then((list) => setState(() => hobbyList = list));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 30.0,
          maxHeight: 30.0,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              MiniHobbyCard(hobbyName: hobbyList[index].hobbyName),
          itemCount: hobbyList.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
