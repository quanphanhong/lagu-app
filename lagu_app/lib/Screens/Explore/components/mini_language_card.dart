import 'package:flutter/material.dart';
import 'package:lagu_app/Models/language.dart';

class MiniLanguageCard extends StatelessWidget {
  final Language language;
  MiniLanguageCard({@required this.language});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          (language.languageSymbol != null && language.languageSymbol != '')
              ? Image.network(
                  language.languageSymbol,
                  width: 20,
                  height: 20,
                )
              : Container(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              language.languageName,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            language.level.toString() + '★',
            style: TextStyle(color: Colors.yellow),
          )
        ],
      ),
    );
  }
}
