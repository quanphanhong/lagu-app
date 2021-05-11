import 'package:mvc_application/view.dart';

class Language{
  static double _languageID;
  static String _languageName;
  static String _languageSymbol;
  static int _languageStar;

  String get languageName => _languageName;
  set languageName(String value){
    _languageName = value;
  }

  String get languageSymbol => _languageSymbol;
  set languageSymbol(String value){
    _languageSymbol = value;
  }
  double get languageID => _languageID;
  set languageID(double value){
    _languageID = value;
  }

  int get languageStar => _languageStar;
  set languageStar(int value){
    _languageStar = value;
  }

  Language(double id, String name, String symbol, int star){
    _languageID = id;
    _languageName = name;
    _languageSymbol = symbol;
    _languageStar = star;
  }
}