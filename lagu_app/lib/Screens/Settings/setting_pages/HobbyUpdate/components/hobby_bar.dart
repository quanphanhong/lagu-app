import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_provider.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Controller/hobby_handler.dart';
import 'package:lagu_app/components/loading_screen.dart';

class HobbyBar extends StatefulWidget {
  final DocumentSnapshot hobbySnapshot;
  final bool isSearchResult;
  HobbyBar({@required this.hobbySnapshot, @required this.isSearchResult});

  @override
  State<StatefulWidget> createState() => HobbyBarState(
        hobbySnapshot: hobbySnapshot,
        isSearchResult: isSearchResult,
      );
}

class HobbyBarState extends State<HobbyBar> {
  final DocumentSnapshot hobbySnapshot;
  final bool isSearchResult;
  HobbyBarState({@required this.hobbySnapshot, @required this.isSearchResult});

  TextEditingController _additionalInfoController = new TextEditingController();
  int _additionalInfoCounter = 0;
  String _lastAdditionalInfoValue = '';
  bool _isFilledWithCurrentValue = false;

  @override
  Widget build(BuildContext context) {
    return isSearchResult
        ? buildHobbyBar(context)
        : InkWell(
            onTap: () {
              setState(() => {
                    _additionalInfoCounter = 0,
                    _lastAdditionalInfoValue = '',
                    _isFilledWithCurrentValue = false
                  });

              showDialog(
                context: context,
                builder: (context) => buildAlertDialog(context),
              );
            },
            child: buildHobbyBar(context),
          );
  }

  Widget buildHobbyBar(BuildContext context) {
    Map<String, Object> data = hobbySnapshot.data();

    return Container(
      height: 50,
      child: Center(
        child: Text(
          data['name'],
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }

  Widget buildAlertDialog(BuildContext context) {
    Map<String, Object> data = hobbySnapshot.data();
    AuthService auth = Provider.of(context).auth;

    return FutureBuilder(
      future: HobbyHandler.instance.getUserHobby(
        auth.getCurrentUID(),
        hobbySnapshot.id,
      ),
      builder: (builderContext, snapshot) {
        if (snapshot.hasData && !_isFilledWithCurrentValue) {
          try {
            _additionalInfoController.text =
                snapshot.data.docs[0]['additionalInfo'];
            _isFilledWithCurrentValue = true;
            setState(() =>
                _additionalInfoCounter = _additionalInfoController.text.length);
          } catch (e) {}
        }

        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 245, 218),
          title: Center(child: Text(data['name'])),
          content: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: <Widget>[
                buildDescriptionBox(context),
                (snapshot.hasData)
                    ? buildInfoTextField(context)
                    : LoadingScreen(loadingSize: 20),
                TextButton.icon(
                  onPressed: () {
                    HobbyHandler.instance.updateUserHobby(auth.getCurrentUID(),
                        hobbySnapshot.id, _additionalInfoController.text);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.done),
                  label: Text('Done'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildDescriptionBox(BuildContext context) {
    Map<String, Object> data = hobbySnapshot.data();

    return Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(255, 214, 210, 196)),
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Text(
          data['description'],
          style: TextStyle(
              color: Color.fromARGB(255, 93, 83, 74),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildInfoTextField(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        decoration: InputDecoration(
            helperText: 'Description',
            counterText: '$_additionalInfoCounter/50 characters',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: _additionalInfoController,
        onChanged: (value) {
          if (value.length > 50)
            _additionalInfoController.text = _lastAdditionalInfoValue;
          else
            _lastAdditionalInfoValue = value;
          setState(() => _additionalInfoCounter = value.length);
        },
      ),
    );
  }
}
