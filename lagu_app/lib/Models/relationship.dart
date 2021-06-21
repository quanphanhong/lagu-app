import 'package:flutter/material.dart';
import 'package:lagu_app/Models/message.dart';
import 'package:lagu_app/Models/user.dart';
import 'package:lagu_app/Models/user.dart';
import 'user.dart';

class Relationship {
  static const STATE_PENDING = 0;
  static const STATE_ACCEPTED = 1;
  static const STATE_DECLINED = 2;
  static const STATE_BLOCKED = 3;

  final String relationshipId;
  final String user_1;
  final String user_2;
  final int status;
  final String actionUser;
  final List<Message> messages;

  Relationship(
      {@required this.relationshipId,
      @required this.user_1,
      @required this.user_2,
      @required this.status,
      @required this.actionUser,
      @required this.messages});
}
