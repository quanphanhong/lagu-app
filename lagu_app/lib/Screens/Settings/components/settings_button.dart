import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  SettingsButton({@required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.all(2),
      ),
      onTap: onPressed,
    );

    /*
    return Container(
      child: FlatButton(onPressed: onPressed, child: Text(title)),
    );*/
  }
}
