import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  SearchBar({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(bottom: 5),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration(
            hintText: 'Search for hobby',
            hintStyle: TextStyle(color: Colors.grey),
            fillColor: Colors.white),
      ),
    );
  }
}
