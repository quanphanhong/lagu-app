import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Screens/UserDetail/components/language_card.dart';
import 'package:mvc_application/view.dart';
import 'package:lagu_app/Data/data.dart';

class LanguageList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguageListState();
}

class LanguageListState extends StateMVC<LanguageList> {
  final languages = List.from(Data.languageList);

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
