import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Screens/UserDetail/components/language_card.dart';
import 'package:mvc_application/view.dart';

class LanguageList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => LanguageListState();

}

class LanguageListState extends StateMVC<LanguageList>{

  List<LanguageCard> languages = [
    LanguageCard(Language(0, "VietNam", "0", 5)),
    LanguageCard(Language(0, "English", "0", 3)),
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 35.0,
          maxHeight: 200.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(child: BuildLanguageList())
          ],
        ),
      )
    );
  }

  Widget BuildLanguageList(){

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: languages.length,
      itemBuilder: (BuildContext context, int index){
        return languages[index];
      },
    );
  }
}