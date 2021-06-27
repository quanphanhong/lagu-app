import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Screens/UserDetail/components/stars.dart';

class LanguageCard extends StatelessWidget {
  final Language item;
  final VoidCallback onClicked;

  const LanguageCard({
    @required this.item,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                item.languageName,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
            Spacer(),
            Container(
              child: Stars(numberOfStars: item.level),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            )
          ],
        ),
      ),
    );
  }
}
