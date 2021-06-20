import 'package:flutter/material.dart';

class Message {
  static const TYPE_TEXT = 0;
  static const TYPE_IMAGE = 1;
  static const TYPE_STICKER = 2;
  static const TYPE_GIF = 3;

  final String messageId;
  final String sender;
  final String receiver;
  final int sentTime;
  final int type;
  final String content;

  Message(
      {@required this.messageId,
      @required this.sender,
      @required this.receiver,
      @required this.sentTime,
      @required this.type,
      @required this.content});
}
