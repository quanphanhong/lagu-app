import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/Login/components/background.dart';
import 'package:lagu_app/components/rounded_button.dart';
import 'package:lagu_app/components/rounded_input_field.dart';
import 'package:lagu_app/Screens/Setup/components/language_list.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<DropdownMenuItem<String>> listDrop = [];

    void loadData(){
      listDrop.add(new DropdownMenuItem(
          child: new Text("Viet Nam"),
      ));
    }


    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SET UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Nick name",
              onChanged: (value) {},
            ),
            LanguageList(),
            RoundedButton(
              text: "COMPLETE",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),

          ],
        ),
      ),
    );
  }
}
