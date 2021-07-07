import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Controller/language_handler.dart';
import 'package:lagu_app/components/loading_screen.dart';

class LevelPicker extends StatefulWidget {
  final String languageId;
  LevelPicker({@required this.languageId});

  @override
  State<StatefulWidget> createState() =>
      LevelPickerState(languageId: languageId);
}

class LevelPickerState extends State<LevelPicker> {
  final String languageId;
  AuthService auth = new AuthService();
  String currentUID;

  bool _isLoading = true;
  double _currentSliderValue = 3;

  LevelPickerState({@required this.languageId});

  Map<int, String> levelTranslator = {
    1: "Beginner",
    2: "Intermediate",
    3: "Good",
    4: "Excellent",
    5: "Native"
  };

  @override
  Widget build(BuildContext context) {
    currentUID = auth.getCurrentUID();

    return FutureBuilder(
      future: LanguageHandler.instance.getUserLanguage(
        currentUID,
        languageId,
      ),
      builder: (builderContext, snapshot) {
        if (snapshot.hasData) {
          if (_isLoading) {
            try {
              setState(() {
                _isLoading = false;
                _currentSliderValue =
                    double.parse(snapshot.data.docs[0].get('level').toString());
              });
            } catch (e) {}
          }

          return Container(
            height: 50,
            child: SliderTheme(
              data: SliderThemeData(
                  valueIndicatorColor: Colors.redAccent,
                  valueIndicatorShape: PaddleSliderValueIndicatorShape()),
              child: Slider(
                value: _currentSliderValue,
                min: 1,
                max: 5,
                divisions: 4,
                activeColor: Colors.redAccent,
                label: levelTranslator[_currentSliderValue.round()],
                onChanged: (double value) async {
                  setState(() {
                    _currentSliderValue = value;
                    LanguageHandler.instance.updateUserLanguage(
                        currentUID, languageId, _currentSliderValue.round());
                  });
                },
              ),
            ),
          );
        } else
          return LoadingScreen(loadingSize: 30);
      },
    );
  }
}
