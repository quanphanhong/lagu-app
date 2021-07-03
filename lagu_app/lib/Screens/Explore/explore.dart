import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Models/user.dart';
import 'package:lagu_app/Screens/Explore/components/user_card.dart';

class Explore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExploreState();
}

class ExploreState extends State<Explore> {
  String lastUser = ' ';
  setLastUser(String userId) {
    if (!mounted) return;
    setState(() => lastUser = userId);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: UserHandler.instance.exploreStream(lastId: lastUser),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userCollection = snapshot.data.docs;
            return Stack(
                clipBehavior: Clip.none,
                children: List.generate(
                  userCollection.length,
                  (index) {
                    User user = new User(
                      userId: userCollection[index].id,
                      nickname: userCollection[index]['nickname'],
                      profilePicture: userCollection[index]['profilePicture'],
                      coverPhoto: userCollection[index]['coverPhoto'],
                      aboutMe: userCollection[index]['aboutMe'],
                    );
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.startToEnd) {
                          UserHandler.instance.addFriend(peerId: user.userId);
                        }
                      },
                      child: UserCard(user: user),
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
