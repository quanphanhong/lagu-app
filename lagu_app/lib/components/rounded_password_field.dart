import 'package:flutter/material.dart';
import 'package:lagu_app/components/text_field_container.dart';
import 'package:lagu_app/const.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
