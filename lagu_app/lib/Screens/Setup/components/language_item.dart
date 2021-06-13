import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Models/language.dart';

class LanguageItem extends StatelessWidget{

  final Language item;
  final onClicked;

  const LanguageItem({
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
          Text(item.languageName,
            style: TextStyle (
                color: Colors.black,
                fontSize: 18
            ),
          ),
          Text(item.languageStar.toString(),
            style: TextStyle (
                color: Colors.blue,
                fontSize: 18
            ),
          )
        ],
      )
    );
  }
}