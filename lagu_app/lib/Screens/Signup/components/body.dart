import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lagu_app/Controller/auth_provider.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Screens/Login/login_screen.dart';
import 'package:lagu_app/Screens/Signup/components/background.dart';
import 'package:lagu_app/components/already_have_an_account_acheck.dart';
import 'package:lagu_app/components/rounded_button.dart';
import 'package:lagu_app/components/rounded_input_field.dart';
import 'package:lagu_app/components/rounded_password_field.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BodyState();
}

class BodyState extends State<Body> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              'assets/images/lagu_logo.png',
              height: size.height * 0.4,
              width: size.width * 0.45,
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                setState(() => email = value);
              },
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {
                setState(() => password = value);
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                if (await Provider.of(context)
                        .auth
                        .createUserWithEmail(email, password) ==
                    AuthService.OK)
                  Fluttertoast.showToast(
                      msg:
                          'Your account has been created. Press \'Sign In\' to start',
                      gravity: ToastGravity.CENTER,
                      toastLength: Toast.LENGTH_LONG);
                else {
                  Fluttertoast.showToast(
                      msg: 'There was an error!', gravity: ToastGravity.CENTER);
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
