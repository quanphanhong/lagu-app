import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/Login/login_screen.dart';
import 'package:lagu_app/Screens/Signup/signup_screen.dart';
import 'package:lagu_app/Screens/Welcome/components/background.dart';
import 'package:lagu_app/components/rounded_button.dart';
import 'package:lagu_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Image.asset(
              'assets/images/lagu_logo.png',
              height: size.height * 0.45,
              width: size.width*0.45,
            ),
            SizedBox(height: size.height * 0.05),

            RoundedButton(
              text: "LOGIN",
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
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
