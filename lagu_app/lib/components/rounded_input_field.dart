import 'package:flutter/material.dart';
import 'package:lagu_app/components/text_field_container.dart';
import 'package:lagu_app/const.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  TextEditingController _controller = new TextEditingController();

  RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  setText(String content) {
    _controller.text = content;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
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
        controller: _controller,
      ),
    );
  }
}
