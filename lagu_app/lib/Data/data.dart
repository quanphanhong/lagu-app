import 'package:lagu_app/Models/hobby.dart';
import 'package:lagu_app/Models/language.dart';

class Data{
  static final List<Language> languageList = [
    Language(
      languageID: 0,
      languageName: "VietNam",
      languageSymbol: "",
      languageStar: "5",
      state: true
    ),
    Language(
      languageID: 1,
      languageName: "English",
      languageSymbol: "",
      languageStar: "3",
      state: true
    ),
    Language(
      languageID: 2,
      languageName: "Janpanese",
      languageSymbol: "",
      languageStar: "3",
      state: false
    ),
  ];

  static final List<Hobby> hobbyList = [
    Hobby(
      hobbyID: 1,
      hobbyName: "reading",
      hobbyDescription: "",
      state: false

    ),
    Hobby(
        hobbyID: 1,
        hobbyName: "swimming",
        hobbyDescription: "",
        state: false
    ),
    Hobby(
        hobbyID: 1,
        hobbyName: "playing game",
        hobbyDescription: "",
        state: false
    ),
  ];

  static final List<String> star = [
    "1",
    "2",
    "3",
    "4",
    "5"
  ];
}

