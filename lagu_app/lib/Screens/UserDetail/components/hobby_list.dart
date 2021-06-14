import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/UserDetail/components/hobby_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_application/view.dart';
import 'package:lagu_app/Data/data.dart';

class HobbyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HobbyListState();
}

class HobbyListState extends StateMVC<HobbyList>{

  final hobbies = List.from(Data.hobbyList);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: 35.0,
            maxHeight: 200.0,
          ),
          child: Row(
            children: <Widget>[
              Expanded(child: BuildHobbyList())
            ],
          ),
        )
    );
  }
  Widget BuildHobbyList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8),
      itemCount: hobbies.length,
      itemBuilder: (BuildContext context, int index) => BuildItem(hobbies[index])
    );
  }
  Widget BuildItem(item)=>HobbyCard(item: item, onClicked: ()=>{});
}