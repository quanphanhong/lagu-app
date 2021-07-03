import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Models/user.dart';
import 'package:lagu_app/Screens/UserDetail/components/action_button.dart';
import 'package:lagu_app/Screens/UserDetail/components/language_list.dart';
import 'package:lagu_app/Screens/UserDetail/components/user-flexible-appbar.dart';
import 'package:lagu_app/Screens/UserDetail/components/hobby_list.dart';
import 'package:lagu_app/components/horizontal_or_line.dart';
import 'package:lagu_app/const.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Body extends StatefulWidget {
  final String userId;

  Body({@required this.userId});

  @override
  State<StatefulWidget> createState() => BodyState(userId: userId);
}

class BodyState extends State<Body> {
  User user;
  final String userId;

  BodyState({@required this.userId}) {
    UserHandler.instance
        .getUser(userId)
        .then((userInfo) => setState(() => user = userInfo));
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return user == null
        ? Center(
            child: SpinKitCubeGrid(
              color: themeColor,
            ),
          )
        : Scaffold(
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
                        ActionButton(userId: userId),
                        HorizontalOrLine(height: 10.0, label: "Hobbies"),
                        HobbyList(userId: userId),
                        HorizontalOrLine(height: 10.0, label: "Languages"),
                        LanguageList(
                          userId: userId,
                        ),
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
