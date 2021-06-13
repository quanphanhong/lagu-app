import 'package:flutter/material.dart';
import 'package:lagu_app/Models/hobby.dart';
import 'package:lagu_app/Models/language.dart';

class User{
  final double userID;
  final String userName;
  final String nickName;
  final String password;
  final String urlAvatar;
  final String background;
  final List<Hobby> hobbies;
  final List<Language> languages;

  User({
    @required this.userID,
    @required this.userName,
    @required this.nickName,
    @required this.password,
    @required this.urlAvatar,
    @required this.background,
    @required this.hobbies,
    @required this.languages,
  });
}