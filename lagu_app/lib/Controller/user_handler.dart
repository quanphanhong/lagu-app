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

  Future<User> getUser(String id) async {
    Completer<User> completer = new Completer<User>();
    List<Hobby> hobbies = await HobbyHandler.instance.getHobbyList(id);
    List<Language> languages =
        await LanguageHandler.instance.getLanguageList(id);

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
        .where('status', isEqualTo: Relationship.STATE_ACCEPTED)
        .get()
        .then((collection) => {
              collection.docs.forEach((doc) {
                if (doc['user_1'] == currentUID)
                  friendIDs.add(doc['user_2']);
                else if (doc['user_2'] == currentUID)
                  friendIDs.add(doc['user_1']);
              })
            });
    yield* FirebaseFirestore.instance
        .collection('users')
        .where(FieldPath.documentId, whereIn: friendIDs)
        .snapshots();
  }

  Future<QuerySnapshot> getAllFriendRequests() async {
    AuthService auth = new AuthService();
    List<String> friendIDs = new List.empty(growable: true);
    String currentUID = auth.getCurrentUID();
    await FirebaseFirestore.instance
        .collection('relationships')
        .get()
        .then((collection) => {
              collection.docs.forEach((doc) {
                if (doc['actionUser'] != currentUID &&
                    doc['status'] == Relationship.STATE_PENDING) {
                  if (doc['user_1'] == currentUID)
                    friendIDs.add(doc['user_2']);
                  else if (doc['user_2'] == currentUID)
                    friendIDs.add(doc['user_1']);
                }
              })
            });

    QuerySnapshot result;
    await FirebaseFirestore.instance
        .collection('users')
        .where(FieldPath.documentId, whereIn: friendIDs)
        .get()
        .then((QuerySnapshot snapshot) => result = snapshot);

    return result;
  }

  Stream<QuerySnapshot> exploreStream({String lastId = ' '}) async* {
    AuthService auth = new AuthService();
    List<String> relativeIDs = new List.empty(growable: true);
    String currentUID = auth.getCurrentUID();
    relativeIDs.add(currentUID);

    await FirebaseFirestore.instance
        .collection('relationships')
        .get()
        .then((collection) => {
              collection.docs.forEach((doc) {
                if (doc['status'] != Relationship.STATE_DECLINED) {
                  if (doc['user_1'] == currentUID) {
                    if (doc['user_2'] != currentUID)
                      relativeIDs.add(doc['user_2']);
                  } else if (doc['user_2'] == currentUID) {
                    if (doc['user_1'] != currentUID)
                      relativeIDs.add(doc['user_1']);
                  }
                }
              })
            });

    yield* FirebaseFirestore.instance
        .collection('users')
        .where(FieldPath.documentId, whereNotIn: relativeIDs)
        .snapshots();
  }

  Future addFriend({String peerId = ''}) async {
    AuthService auth = new AuthService();
    String currentUID = auth.getCurrentUID();

    String groupChatId;
    if (currentUID.hashCode <= peerId.hashCode) {
      groupChatId = '$currentUID-$peerId';
    } else {
      groupChatId = '$peerId-$currentUID';
    }

    var relationshipReference = FirebaseFirestore.instance
        .collection('relationships')
        .doc('$groupChatId');

    await FirebaseFirestore.instance.runTransaction(
      (transaction) async {
        transaction.set(relationshipReference, {
          'user_1': currentUID,
          'user_2': peerId,
          'actionUser': currentUID,
          'status': Relationship.STATE_PENDING
        });
      },
    );
  }

  Future setRelationshipStatus({String peerId = '', int status}) async {
    AuthService auth = new AuthService();
    String currentUID = auth.getCurrentUID();

    String groupChatId;
    if (currentUID.hashCode <= peerId.hashCode) {
      groupChatId = '$currentUID-$peerId';
    } else {
      groupChatId = '$peerId-$currentUID';
    }

    var relationshipReference = FirebaseFirestore.instance
        .collection('relationships')
        .doc('$groupChatId');

    await FirebaseFirestore.instance.runTransaction(
      (transaction) async {
        transaction.update(relationshipReference, {
          'actionUser': currentUID,
          'status': status,
        });
      },
    );
  }

  Future<Relationship> getRelationship({String peerId = ''}) async {
    AuthService auth = new AuthService();
    String currentUID = auth.getCurrentUID();

    String groupChatId;
    if (currentUID.hashCode <= peerId.hashCode) {
      groupChatId = '$currentUID-$peerId';
    } else {
      groupChatId = '$peerId-$currentUID';
    }

    Relationship result;
    await FirebaseFirestore.instance
        .collection('relationships')
        .doc('$groupChatId')
        .get()
        .then((DocumentSnapshot snapshot) => {
              result = new Relationship(
                  relationshipId: snapshot.id,
                  user_1: snapshot.get('user_1'),
                  user_2: snapshot.get('user_2'),
                  status: snapshot.get('status'),
                  actionUser: snapshot.get('actionUser'))
            });

    return result;
  }
}
