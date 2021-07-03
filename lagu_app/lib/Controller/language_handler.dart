import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
}
