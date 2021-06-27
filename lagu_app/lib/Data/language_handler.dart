import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lagu_app/Models/language.dart';

class LanguageHandler {
  static LanguageHandler instance = new LanguageHandler();

  Future<Language> getLanguage(String id) async {
    Completer<Language> completer = new Completer<Language>();

    FirebaseFirestore.instance
        .doc('hobbies/$id')
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
}
