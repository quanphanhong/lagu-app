import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserHandler {
  static Future<String> getUserId(String username, String password) async {
    Completer<String> completer = new Completer<String>();

    Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance.collection('users')
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: password).snapshots();

    snapshot.forEach((element) {
      if (element.docs.isEmpty) completer.complete(null);
      element.docs.asMap().forEach((key, value) {
        completer.complete(element.docs[key]['id']);
      });
    });

    return completer.future;
  }

  static Future<String> getNickname(String id) async {
    Completer<String> completer = new Completer<String>();

    Stream<QuerySnapshot> snapshot = FirebaseFirestore.instance.collection('users')
        .where('id', isEqualTo: id).snapshots();

    snapshot.forEach((element) {
      if (element.docs.isEmpty) completer.complete('user');
      element.docs.asMap().forEach((key, value) {
        completer.complete(element.docs[key]['nickname']);
      });
    });

    return completer.future;
  }
}