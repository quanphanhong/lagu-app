import 'package:flutter/material.dart';
import 'package:lagu_app/Models/user.dart';
import 'package:lagu_app/Screens/Explore/components/cover_photo.dart';
import 'package:lagu_app/Screens/Explore/components/mini_hobby_card.dart';
import 'package:lagu_app/Screens/Explore/components/mini_hobby_card_list.dart';
import 'package:lagu_app/Screens/Explore/components/profile_picture.dart';
import 'package:lagu_app/components/horizontal_or_line.dart';
import 'package:lagu_app/Screens/UserDetail/components/user-flexible-appbar.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard({this.user});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(user.userId),
      child: Container(
          width: 400,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  CoverPhoto(coverPhoto: user.coverPhoto),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 150),
                      ProfilePicture(profilePicture: user.profilePicture),
                    ],
                  )
                ],
              ),
              Text(
                user.nickname,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.aboutMe,
                style: TextStyle(fontSize: 20),
              ),
              HorizontalOrLine(
                label: 'Hobbies',
                height: 30,
              ),
              MiniHobbyCardList(userId: user.userId)
            ],
          )),
    );
  }
}
