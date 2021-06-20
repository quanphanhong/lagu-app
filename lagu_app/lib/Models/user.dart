import 'package:flutter/material.dart';
import 'hobby.dart';
import 'language.dart';

class User {
  final double userId;
  final String nickname;
  final String profilePicture;
  final String coverPhoto;
  final List<Hobby> hobbies;
  final List<Language> languages;

  User({
    @required this.userId,
    @required this.nickname,
    @required this.profilePicture,
    @required this.coverPhoto,
    @required this.hobbies,
    @required this.languages,
  });
}
