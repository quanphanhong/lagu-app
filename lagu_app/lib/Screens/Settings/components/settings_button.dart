import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color backgroundColor;
  final double leftMargin;
  SettingsButton(
      {@required this.title,
      this.onPressed,
      this.backgroundColor = Colors.blue,
      this.leftMargin = 25});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      shadowColor: Colors.transparent,
      borderOnForeground: false,
      semanticContainer: false,
      child: InkWell(
        child: Container(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(50, 20),
                  bottomLeft: Radius.elliptical(30, 50))),
          margin: EdgeInsets.only(left: leftMargin, top: 10),
        ),
        onTap: onPressed,
      ),
    );

    /*
    return Container(
      child: FlatButton(onPressed: onPressed, child: Text(title)),
    );*/
  }
}
