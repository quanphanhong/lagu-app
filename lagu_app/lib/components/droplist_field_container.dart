import 'package:flutter/material.dart';
import 'package:lagu_app/constants.dart';

class DroplistFieldContainer extends StatelessWidget {
  final Widget child;
  final DropdownButton button;
  const DroplistFieldContainer({
    Key key,
    this.child,
    this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
