import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/Login/login_screen.dart';
import 'package:lagu_app/Screens/Signup/components/background.dart';
import 'package:lagu_app/components/already_have_an_account_acheck.dart';
import 'package:lagu_app/components/rounded_button.dart';
import 'package:lagu_app/components/rounded_input_field.dart';
import 'package:lagu_app/components/rounded_password_field.dart';

class Body extends StatelessWidget {
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
              width: size.width*0.45,
            ),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
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
