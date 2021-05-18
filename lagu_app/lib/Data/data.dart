import 'package:lagu_app/Models/hobby.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:lagu_app/Models/user.dart';

class Data{
  static final List<Hobby> hobbyList = [
    Hobby(
        hobbyID: 0,
        hobbyName: "Reading",
        hobbyDescription: "I read every day"
    ),
    Hobby(
        hobbyID: 1,
        hobbyName: "Gamming",
        hobbyDescription: "I play every day"
    ),
    Hobby(
        hobbyID: 2,
        hobbyName: "Gyming",
        hobbyDescription: ""
    ),
  ];

  static final List<Language> languageList = [
    Language(
        languageID: 0,
        languageName: "VietNam",
        languageSymbol: "",
        languageStar: 1,
    ),
    Language(
      languageID: 1,
      languageName: "English",
      languageSymbol: "",
      languageStar: 5,
    ),
    Language(
      languageID: 0,
      languageName: "Janpanese",
      languageSymbol: "",
      languageStar: 3,
    ),
  ];

  static final user = new User(
      userID: 0,
      userName: "lamsonhai",
      nickName: "Lam Hai",
      password: "lamhai123",
      urlAvatar: "assets/images/avatar_sample.jpg",
      background: "assets/images/sea_background.jpg",
      hobbies: hobbyList,
      languages: languageList);
}