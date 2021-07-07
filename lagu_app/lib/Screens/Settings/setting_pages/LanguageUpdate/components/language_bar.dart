import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LanguageBar extends StatefulWidget {
  final DocumentSnapshot languageSnapshot;
  final bool isSearchResult;
  LanguageBar({@required this.languageSnapshot, this.isSearchResult});

  @override
  State<StatefulWidget> createState() => LanguageBarState(
        languageSnapshot: languageSnapshot,
        isSearchResult: isSearchResult,
      );
}

class LanguageBarState extends State<LanguageBar> {
  final DocumentSnapshot languageSnapshot;
  final bool isSearchResult;
  LanguageBarState({@required this.languageSnapshot, this.isSearchResult});

  @override
  Widget build(BuildContext context) {
    Map<String, Object> data = languageSnapshot.data();

    return InkWell(
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (data['symbol'] != null && data['symbol'] != '')
                ? Image.network(
                    data['symbol'],
                    width: 20,
                    height: 20,
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                data['name'],
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      ),
    );
  }
}
