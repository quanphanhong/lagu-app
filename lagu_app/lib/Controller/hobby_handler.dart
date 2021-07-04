import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lagu_app/Models/hobby.dart';

import 'auth_service.dart';

class HobbyHandler {
  static HobbyHandler instance = new HobbyHandler();

  Future<List<Hobby>> getHobbyList(String userId) async {
    List<Hobby> hobbies = new List.empty(growable: true);

    await FirebaseFirestore.instance
        .collection('user_hobby')
        .get()
        .then((QuerySnapshot snapshot) async => {
              for (var doc in snapshot.docs)
                {
                  if (doc['userId'] == userId)
                    {
                      await HobbyHandler.instance.getHobby(doc['hobbyId']).then(
                          (Hobby hobby) => {
                                hobby.additionalInfo = doc['additionalInfo'],
                                hobbies.add(hobby)
                              })
                    }
                }
            });
    return hobbies;
  }

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

  Future<QuerySnapshot> getUserHobby(String userId, String hobbyId) async {
    QuerySnapshot result;

    await FirebaseFirestore.instance
        .collection('user_hobby')
        .where('userId', isEqualTo: userId)
        .where('hobbyId', isEqualTo: hobbyId)
        .get()
        .then((QuerySnapshot snapshot) => result = snapshot);

    return result;
  }

  void updateUserHobby(
      String userId, String hobbyId, String additionalInfo) async {
    await FirebaseFirestore.instance
        .collection('user_hobby')
        .where('userId', isEqualTo: userId)
        .where('hobbyId', isEqualTo: hobbyId)
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((doc) =>
                  doc.reference.update({'additionalInfo': additionalInfo}))
            });
  }

  Stream<QuerySnapshot> allHobbyStream({String query = ''}) async* {
    yield* FirebaseFirestore.instance
        .collection('hobbies')
        .where('name', isGreaterThanOrEqualTo: query.toUpperCase())
        .where('name', isLessThan: query.toUpperCase() + 'z')
        .snapshots();
  }

  Stream<QuerySnapshot> hobbyStream() async* {
    AuthService auth = new AuthService();
    List<String> hobbyIDs = new List.empty(growable: true);
    String currentUID = auth.getCurrentUID();
    await FirebaseFirestore.instance
        .collection('user_hobby')
        .where('userId', isEqualTo: currentUID)
        .get()
        .then((collection) => {
              collection.docs.forEach((doc) {
                hobbyIDs.add(doc['hobbyId']);
              })
            });
    yield* FirebaseFirestore.instance
        .collection('hobbies')
        .where(FieldPath.documentId, whereIn: hobbyIDs)
        .snapshots();
  }

  void deleteHobby(String hobbyId) async {
    AuthService auth = new AuthService();
    String currentUID = auth.getCurrentUID();
    await FirebaseFirestore.instance
        .collection('user_hobby')
        .where('userId', isEqualTo: currentUID)
        .where('hobbyId', isEqualTo: hobbyId)
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs
                  .forEach((DocumentSnapshot doc) => doc.reference.delete())
            });
  }

  void addHobby({String hobbyId, String additionalInfo = ''}) async {
    AuthService auth = new AuthService();
    String currentUID = auth.getCurrentUID();

    var addingInfo = {
      "hobbyId": hobbyId,
      "userId": currentUID,
      "additionalInfo": additionalInfo,
    };

    await FirebaseFirestore.instance.collection('user_hobby').add(addingInfo);
  }
}
