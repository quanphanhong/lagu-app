import 'package:flutter/material.dart';
import 'package:lagu_app/constants.dart';
import 'package:lagu_app/components/text_field_container.dart';
import 'package:lagu_app/components/droplist_field_container.dart';

class RoundedDropList extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedDropList({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DroplistFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),

    );
  }
}
