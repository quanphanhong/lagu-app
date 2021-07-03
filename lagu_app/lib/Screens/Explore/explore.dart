import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Models/user.dart';
import 'package:lagu_app/Screens/Explore/components/user_card.dart';

class Explore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExploreState();
}

class ExploreState extends State<Explore> {
  String lastUser = 'A6bsBoZeCcR0bv6EeWVhE4B7tgw2';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: UserHandler.instance.userStream(lastId: lastUser),
        builder: (context, snapshot) {
          var userCollection = snapshot.data.docs;
          if (snapshot.hasData) {
            return Stack(
                clipBehavior: Clip.none,
                children: List.generate(
                  snapshot.data.docs.length,
                  (index) {
                    User user = new User(
                      userId: userCollection[index].id,
                      nickname: userCollection[index]['nickname'],
                      profilePicture: userCollection[index]['profilePicture'],
                      coverPhoto: userCollection[index]['coverPhoto'],
                      aboutMe: userCollection[index]['aboutMe'],
                    );
                    return UserCard(
                      user: user,
                    );
                  },
                ));
          } else
            return Container();
        },
      ),
    );
  }
}
