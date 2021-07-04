import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Models/hobby.dart';

class HobbyCard extends StatelessWidget {
  final Hobby item;
  final VoidCallback onClicked;

  const HobbyCard({
    @required this.item,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 20),
      height: categoryHeight,
      decoration: BoxDecoration(
          color: Colors.blue.shade400,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.hobbyName,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                item.additionalInfo,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
