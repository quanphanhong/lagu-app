import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/language_handler.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Screens/Explore/components/mini_language_card.dart';

class MiniLanguageCardList extends StatefulWidget {
  final String userId;
  MiniLanguageCardList({@required this.userId});

  @override
  State<StatefulWidget> createState() =>
      MiniLanguageCardListState(userId: userId);
}

class MiniLanguageCardListState extends State<MiniLanguageCardList> {
  List<Language> languageList = new List<Language>.empty(growable: true);
  final String userId;

  MiniLanguageCardListState({@required this.userId}) {
    LanguageHandler.instance
        .getLanguageList(userId)
        .then((list) => setState(() => languageList = list));
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
              MiniLanguageCard(language: languageList[index]),
          itemCount: languageList.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
