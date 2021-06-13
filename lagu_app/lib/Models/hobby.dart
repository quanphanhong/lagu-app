import 'package:flutter/material.dart';

class Hobby{
  final double hobbyID;
  final String hobbyName;
  final String hobbyDescription;
  bool state;


  Hobby({
    @required this.hobbyID,
    @required this.hobbyName,
    @required this.hobbyDescription,
    @required this.state
  });
}

