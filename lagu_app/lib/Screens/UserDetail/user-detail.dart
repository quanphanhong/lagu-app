import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/UserDetail/components/body.dart';

class UserDetailScreen extends StatelessWidget {
  final String userId;

  UserDetailScreen({@required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(
      userId: userId,
    ));
  }
}
