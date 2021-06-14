import 'package:mvc_application/view.dart';

class Language{
  final double languageID;
  final String languageName;
  final String languageSymbol;
  final int languageStar;

  Language({
    @required this.languageID,
    @required this.languageName,
    @required this.languageSymbol,
    @required this.languageStar
  });
}