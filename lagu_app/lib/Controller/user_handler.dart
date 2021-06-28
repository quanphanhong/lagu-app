import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lagu_app/Controller/hobby_handler.dart';
import 'package:lagu_app/Controller/language_handler.dart';
import 'package:lagu_app/Models/hobby.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Models/user.dart';

class UserHandler {
  static UserHandler instance = new UserHandler();

  Future<List<Hobby>> getHobbyList(String userId) {
    Completer<List<Hobby>> completer = new Completer<List<Hobby>>();
    List<Hobby> hobbies = new List.empty(growable: true);

    FirebaseFirestore.instance
        .collection('user_hobby')
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((doc) {
                if (doc['userId'] == userId) {
                  HobbyHandler.instance
                      .getHobby(doc['hobbyId'])
                      .then((Hobby hobby) => {
                            hobby.additionalInfo = doc['additionalInfo'],
                            hobbies.add(hobby),
                          });
                }
              }),
              completer.complete(hobbies)
            });
    return completer.future;
  }

  Future<List<Language>> getLanguageList(String userId) {
    Completer<List<Language>> completer = new Completer<List<Language>>();
    List<Language> languages = new List.empty(growable: true);

    FirebaseFirestore.instance
        .collection('user_language')
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.forEach((doc) {
                if (doc['userId'] == userId) {
                  LanguageHandler.instance
                      .getLanguage(doc['languageId'])
                      .then((Language language) => {
                            language.level = doc['level'],
                            languages.add(language),
                          });
                }
              }),
              completer.complete(languages)
            });
    return completer.future;
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
                      hobbies: hobbies,
                      languages: languages))
                }
              else
                {completer.complete(null)}
            });

    return completer.future;
  }
}
