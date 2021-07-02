import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Screens/UserDetail/components/language_card.dart';

class LanguageList extends StatefulWidget {
  final String userId;

  LanguageList({@required this.userId});

  @override
  State<StatefulWidget> createState() => LanguageListState(userId: userId);
}

class LanguageListState extends State<LanguageList> {
  List<Language> languages = new List<Language>.empty(growable: true);
  final String userId;

  LanguageListState({@required this.userId}) {
    UserHandler.instance
        .getLanguageList(userId)
        .then((languageList) => setState(() => languages = languageList));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 35.0,
        maxHeight: 250.0,
      ),
      child: Row(
        children: <Widget>[Expanded(child: BuildLanguageList())],
      ),
    ));
  }

  Widget BuildLanguageList() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) =>
            BuildItem(languages[index]));
  }

  Widget BuildItem(item) => LanguageCard(item: item, onClicked: () => {});
}
