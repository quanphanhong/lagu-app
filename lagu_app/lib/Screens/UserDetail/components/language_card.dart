import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Models/language.dart';

class LanguageCard extends StatelessWidget{

  final Language item;
  final VoidCallback onClicked;

  const LanguageCard({
    @required this.item,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

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
            ],
          ),
        ),
      ),
    );
  }
}