import 'package:mvc_application/view.dart';

class Language {
  final double languageId;
  final String languageName;
  final String languageSymbol;
  final int level;

  Language(
      {@required this.languageId,
      @required this.languageName,
      @required this.languageSymbol,
      @required this.level});
}
