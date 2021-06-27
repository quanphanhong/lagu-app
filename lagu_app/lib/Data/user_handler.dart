import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lagu_app/Models/user.dart';

class UserHandler {
  static UserHandler _instance;

  static UserHandler getInstance() {
    if (_instance == null) _instance = new UserHandler();
    return _instance;
  }

  Future<User> getUser(String id) async {
    Completer<User> completer = new Completer<User>();

    FirebaseFirestore.instance
        .doc('users/$id')
        .get()
        .then((DocumentSnapshot snapshot) => {
              if (snapshot.exists)
                {
                  completer.complete(new User(
                      userId: id,
                      nickname: snapshot.get('nickname'),
                      profilePicture: snapshot.get('profilePicture'),
                      coverPhoto: snapshot.get('coverPhoto')))
                }
              else
                {completer.complete(new User())}
            });

    return completer.future;
  }
}
