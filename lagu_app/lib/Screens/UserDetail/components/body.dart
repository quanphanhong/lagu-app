import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Data/user_handler.dart';
import 'package:lagu_app/Models/user.dart';
import 'package:lagu_app/Screens/UserDetail/components/language_list.dart';
import 'package:lagu_app/Screens/UserDetail/components/user-flexible-appbar.dart';
import 'package:lagu_app/Screens/UserDetail/components/hobby_list.dart';
import 'package:lagu_app/Screens/UserDetail/components/horizontal_or_line.dart';
import 'package:lagu_app/Data/data.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BodyState();
}

class BodyState extends State<Body> {
  User user = Data.userInfo;

  BodyState() {
    UserHandler.instance
        .getUser('ynQTsc1bWIhZnxGtKfZj6HyMC3x1')
        .then((userInfo) => setState(() => user = userInfo));
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(
                expandedHeight: screensize.height / 4, user: user),
            pinned: true,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                  child: Center(
                      child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HorizontalOrLine(height: 10.0, label: "Hobbies"),
                  HobbyList(),
                  HorizontalOrLine(height: 10.0, label: "Languages"),
                  LanguageList(),
                  SizedBox(
                    height: 135,
                  ),
                ],
              ))),
            ]),
          )
        ],
      ),
    );
  }
}
