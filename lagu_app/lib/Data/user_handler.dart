import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lagu_app/Data/hobby_hander.dart';
import 'package:lagu_app/Data/language_handler.dart';
import 'package:lagu_app/Models/hobby.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Models/user.dart';

class UserHandler {
  static UserHandler instance = new UserHandler();

  Future<User> getUser(String id) async {
    Completer<User> completer = new Completer<User>();
    List<Hobby> hobbies = new List.empty();
    List<Language> languages = new List.empty();

    FirebaseFirestore.instance
        .doc('users/$id')
        .get()
        .then((DocumentSnapshot snapshot) => {
              if (snapshot.exists)
                {
                  // Retrieve list of Hobbies
                  FirebaseFirestore.instance
                      .collection('user_hobby')
                      .get()
                      .then((QuerySnapshot snapshot) => {
                            snapshot.docs.forEach((doc) {
                              if (doc['userId'] == id) {
                                HobbyHandler.instance
                                    .getHobby(doc['hobbyId'])
                                    .then((Hobby hobby) => {
                                          hobby.additionalInfo =
                                              doc['additionalInfo'],
                                          hobbies.add(hobby)
                                        });
                              }
                            })
                          }),
                  // Retrieve list of Languages
                  FirebaseFirestore.instance
                      .collection('user_language')
                      .get()
                      .then((QuerySnapshot snapshot) => {
                            snapshot.docs.forEach((doc) {
                              if (doc['userId'] == id) {
                                LanguageHandler.instance
                                    .getLanguage(doc['languageId'])
                                    .then((Language language) => {
                                          language.level = doc['level'],
                                          languages.add(language)
                                        });
                              }
                            })
                          }),

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
