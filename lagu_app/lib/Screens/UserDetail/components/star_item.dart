import 'package:flutter/material.dart';

class StarItem extends StatelessWidget {
  final int numberOfStars;
  final int starIndex;

  StarItem({@required this.numberOfStars, @required this.starIndex});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage((starIndex <= numberOfStars)
          ? 'assets/images/star_light.png'
          : 'assets/images/star_grey.png'),
      width: 20,
      height: 20,
    );
  }
}
