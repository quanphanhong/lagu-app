import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Models/language.dart';

class LanguageCard extends StatelessWidget{

  Language languageText;

  LanguageCard(this.languageText);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("")
                        )
                    )),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(languageText.languageName,
                    style: TextStyle (
                        color: Colors.black,
                        fontSize: 18
                    ),
                  ),
                  Text(languageText.languageStar.toString(),
                    style: TextStyle (
                        color: Colors.blue,
                        fontSize: 18
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    return Card(
      child: Row(
        children: <Widget>[
          Text(languageText.languageName),
          Text(languageText.languageStar.toString())
        ],
      ),
    );
  }

}