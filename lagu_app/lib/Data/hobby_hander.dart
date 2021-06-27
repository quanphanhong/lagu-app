import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lagu_app/Models/hobby.dart';

class HobbyHandler {
  static HobbyHandler instance = new HobbyHandler();

  Future<Hobby> getHobby(String id) async {
    Completer<Hobby> completer = new Completer<Hobby>();

    FirebaseFirestore.instance
        .doc('hobbies/$id')
        .get()
        .then((DocumentSnapshot snapshot) => {
              if (snapshot.exists)
                {
                  completer.complete(new Hobby(
                      hobbyId: id,
                      hobbyName: snapshot.get('name'),
                      hobbyDescription: snapshot.get('description')))
                }
              else
                {completer.complete(null)}
            });
    return completer.future;
  }
}
