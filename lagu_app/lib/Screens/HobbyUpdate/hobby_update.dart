import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/user_handler.dart';
import 'package:lagu_app/Screens/HobbyUpdate/components/hobby_bar.dart';
import 'package:lagu_app/components/search_bar.dart';

class HobbyUpdate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HobbyUpdateState();
}

class HobbyUpdateState extends State<HobbyUpdate> {
  ScrollController _controller = new ScrollController();

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hobbies'),
      ),
      body: Column(
        children: <Widget>[
          SearchBar(
            onChanged: (value) {
              setState(() => searchQuery = value);
            },
          ),
          (searchQuery == '')
              ? Flexible(
                  child: StreamBuilder(
                    stream: UserHandler.instance.hobbyStream(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Scaffold();
                      } else {
                        return ListView.builder(
                          padding: EdgeInsets.all(10.0),
                          itemBuilder: (context, index) {
                            final item = snapshot.data.docs[index];
                            return Dismissible(
                              key: Key(item['name']),
                              child: HobbyBar(snapshot: item),
                              onDismissed: (direction) async {
                                await UserHandler.instance.deleteHobby(item.id);
                              },
                            );
                          },
                          itemCount: snapshot.data.docs.length,
                          controller: _controller,
                        );
                      }
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
