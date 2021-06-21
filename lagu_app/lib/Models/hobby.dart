import 'package:flutter/material.dart';

class Hobby {
  final double hobbyId;
  final String hobbyName;
  final String hobbyDescription;
  final String additionalInfo;

  const Hobby(
      {@required this.hobbyId,
      @required this.hobbyName,
      @required this.hobbyDescription,
      @required this.additionalInfo});
}
