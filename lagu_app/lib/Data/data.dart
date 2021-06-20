import 'package:lagu_app/Models/hobby.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Models/message.dart';
import 'package:lagu_app/Models/relationship.dart';
import 'package:lagu_app/Models/user.dart';

class Data {
  static final List<Hobby> hobbyList = [
    Hobby(
        hobbyId: 0,
        hobbyName: "Reading",
        hobbyDescription: "I read every day",
        additionalInfo: "Something"),
    Hobby(
        hobbyId: 1,
        hobbyName: "Gamming",
        hobbyDescription: "I play every day",
        additionalInfo: "Just another idea"),
    Hobby(
        hobbyId: 2,
        hobbyName: "Gyming",
        hobbyDescription: "",
        additionalInfo: "Well"),
  ];

  static final List<Language> languageList = [
    Language(
        languageId: 0, languageName: "VietNam", languageSymbol: "", level: 3),
    Language(
        languageId: 1, languageName: "English", languageSymbol: "", level: 2),
    Language(
        languageId: 0, languageName: "Janpanese", languageSymbol: "", level: 1),
  ];

  static final user = new User(
      userId: 0,
      nickname: "lamsonhai",
      profilePicture: "assets/images/avatar_sample.jpg",
      coverPhoto: "assets/images/sea_background.jpg",
      hobbies: hobbyList,
      languages: languageList);

  static final other_user = new User(
      userId: 1,
      nickname: "hihi",
      profilePicture: "assets/images/avatar_sample.jpg",
      coverPhoto: "assets/images/sea_background.jpg",
      hobbies: hobbyList,
      languages: languageList);

  static final messageList = [
    Message(
        messageId: "0",
        sender: "0",
        receiver: "1",
        sentTime: 000,
        type: Message.TYPE_TEXT,
        content: "Hello there")
  ];

  static final relationship = new Relationship(
      relationshipId: "0",
      user_1: "0",
      user_2: "1",
      status: Relationship.STATE_ACCEPTED,
      actionUser: "0",
      messages: messageList);
}
