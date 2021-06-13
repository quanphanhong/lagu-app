import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Models/hobby.dart';

class HobbyItem extends StatelessWidget{

  final Hobby item;
  final onClicked;

  const HobbyItem({
    @required this.item,
    @required this.onClicked,
    Key key,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(item.hobbyName,
              style: TextStyle (
                  color: Colors.black,
                  fontSize: 18
              ),
            ),
          ],
        )
    );
  }
}