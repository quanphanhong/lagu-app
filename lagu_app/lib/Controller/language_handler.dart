import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Models/language.dart';

class LanguageHandler {
  static LanguageHandler instance = new LanguageHandler();

  Future<Language> getLanguage(String id) async {
    Completer<Language> completer = new Completer<Language>();

    FirebaseFirestore.instance
        .doc('languages/$id')
        .get()
        .then((DocumentSnapshot snapshot) => {
              if (snapshot.exists)
                {
                  completer.complete(new Language(
                      languageId: id,
                      languageName: snapshot.get('name'),
                      languageSymbol: snapshot.get('symbol')))
                }
              else
                {completer.complete(null)}
            });
    return completer.future;
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

  Stream<QuerySnapshot> allLanguageStream({String query = ''}) async* {
    yield* FirebaseFirestore.instance
        .collection('languages')
        .where('name', isGreaterThanOrEqualTo: query.toUpperCase())
        .where('name', isLessThan: query.toUpperCase() + 'z')
        .snapshots();
  }

  Stream<QuerySnapshot> languageStream() async* {
    AuthService auth = new AuthService();
    List<String> languageIDs = new List.empty(growable: true);
    String currentUID = auth.getCurrentUID();
    await FirebaseFirestore.instance
        .collection('user_language')
        .where('userId', isEqualTo: currentUID)
        .get()
        .then((collection) => {
              collection.docs.forEach((doc) {
                languageIDs.add(doc['languageId']);
              })
            });
    yield* FirebaseFirestore.instance
        .collection('languages')
        .where(FieldPath.documentId, whereIn: languageIDs)
        .snapshots();
  }

  void deleteLanguage(String languageId) async {
    AuthService auth = new AuthService();
    String currentUID = auth.getCurrentUID();
    await FirebaseFirestore.instance
        .collection('user_language')
        .where('userId', isEqualTo: currentUID)
        .where('languageId', isEqualTo: languageId)
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs
                  .forEach((DocumentSnapshot doc) => doc.reference.delete())
            });
  }

  void addLanguage({String languageId, int level = 5}) async {
    AuthService auth = new AuthService();
    String currentUID = auth.getCurrentUID();

    var addingInfo = {
      "languageId": languageId,
      "userId": currentUID,
      "level": level,
    };

    await FirebaseFirestore.instance
        .collection('user_language')
        .add(addingInfo);
  }
}
