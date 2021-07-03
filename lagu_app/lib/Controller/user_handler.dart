import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Controller/hobby_handler.dart';
import 'package:lagu_app/Controller/language_handler.dart';
import 'package:lagu_app/Models/hobby.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Models/relationship.dart';
import 'package:lagu_app/Models/user.dart';

class UserHandler {
  static UserHandler instance = new UserHandler();

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

  Future<List<Language>> getLanguageList(String userId) async {
    List<Language> languages = new List.empty(growable: true);

    await FirebaseFirestore.instance
        .collection('user_language')
        .get()
        .then((QuerySnapshot snapshot) async => {
              for (var doc in snapshot.docs)
                {
                  if (doc['userId'] == userId)
                    {
                      await LanguageHandler.instance
                          .getLanguage(doc['languageId'])
                          .then((Language language) => {
                                language.level = doc['level'],
                                languages.add(language)
                              })
                    }
                }
            });
    return languages;
  }

  Future<User> getUser(String id) async {
    Completer<User> completer = new Completer<User>();
    List<Hobby> hobbies = await getHobbyList(id);
    List<Language> languages = await getLanguageList(id);

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
                      coverPhoto: snapshot.get('coverPhoto'),
                      aboutMe: snapshot.get('aboutMe'),
                      hobbies: hobbies,
                      languages: languages))
                }
              else
                {completer.complete(null)}
            });

    return completer.future;
  }

  Future<void> insertCurrentUserInfo(
      String profileUrl, String coverUrl, String nickname, String aboutMe) {
    AuthService auth = new AuthService();
    var addingInfo = {
      "profilePicture": profileUrl,
      "coverPhoto": coverUrl,
      "nickname": nickname,
      "aboutMe": aboutMe
    };

    return FirebaseFirestore.instance
        .collection('users')
        .doc(auth.getCurrentUID())
        .set(addingInfo);
  }

  Future<void> updateUserInfo(String uid, String profileUrl, String coverUrl,
      String nickname, String aboutMe) {
    var addingInfo = {
      "profilePicture": profileUrl,
      "coverPhoto": coverUrl,
      "nickname": nickname,
      "aboutMe": aboutMe
    };

    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(addingInfo);
  }

  Stream<QuerySnapshot> friendStream({String query = ''}) async* {
    AuthService auth = new AuthService();
    List<String> friendIDs = new List.empty(growable: true);
    String currentUID = auth.getCurrentUID();
    await FirebaseFirestore.instance
        .collection('relationships')
        .where(FieldPath.documentId, isGreaterThanOrEqualTo: currentUID)
        .where(FieldPath.documentId, isLessThan: currentUID + 'z')
        .where('status', isEqualTo: Relationship.STATE_ACCEPTED)
        .get()
        .then((collection) => {
              collection.docs.forEach((doc) {
                if (doc['user_1'] == currentUID)
                  friendIDs.add(doc['user_2']);
                else
                  friendIDs.add(doc['user_1']);
              })
            });
    yield* FirebaseFirestore.instance
        .collection('users')
        .where(FieldPath.documentId, whereIn: friendIDs)
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

  Stream<QuerySnapshot> allHobbyStream({String query = ''}) async* {
    yield* FirebaseFirestore.instance
        .collection('hobbies')
        .where('name', isGreaterThanOrEqualTo: query.toUpperCase())
        .where('name', isLessThan: query.toUpperCase() + 'z')
        .snapshots();
  }

  deleteHobby(String hobbyId) async {
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

  addHobby({String hobbyId, String additionalInfo = ''}) async {
    AuthService auth = new AuthService();
    String currentUID = auth.getCurrentUID();

    var addingInfo = {
      "hobbyId": hobbyId,
      "userId": currentUID,
      "additionalInfo": additionalInfo,
    };

    return FirebaseFirestore.instance.collection('user_hobby').add(addingInfo);
  }

  Stream<QuerySnapshot> userStream({String lastId = ''}) async* {
    yield* FirebaseFirestore.instance.collection('users').snapshots();
  }
}
