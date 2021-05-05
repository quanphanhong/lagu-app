import 'package:flutter/cupertino.dart';
import 'package:lagu_app/messaging_appbar.dart';
import 'package:mvc_application/view.dart';

class Messaging extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessagingState();
}

class MessagingState extends StateMVC<Messaging> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OK',
      home: Scaffold(
        appBar: MessagingAppBar(),
        body: Center(
          child: Text('Test'),
        ),
      ),
    );
  }
  
}