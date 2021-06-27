import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/UserDetail/components/star_item.dart';

class Stars extends StatelessWidget {
  final int numberOfStars;

  Stars({@required this.numberOfStars});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        StarItem(numberOfStars: numberOfStars, starIndex: 1),
        StarItem(numberOfStars: numberOfStars, starIndex: 2),
        StarItem(numberOfStars: numberOfStars, starIndex: 3),
        StarItem(numberOfStars: numberOfStars, starIndex: 4),
        StarItem(numberOfStars: numberOfStars, starIndex: 5),
      ],
    );
  }
}
