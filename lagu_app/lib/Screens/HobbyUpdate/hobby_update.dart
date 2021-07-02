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
  TextEditingController _searchBarController = new TextEditingController();

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
            controller: _searchBarController,
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
              : Flexible(
                  child: StreamBuilder(
                    stream:
                        UserHandler.instance.allHobbyStream(query: searchQuery),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Scaffold();
                      } else {
                        return ListView.builder(
                          padding: EdgeInsets.all(10.0),
                          itemBuilder: (context, index) {
                            final item = snapshot.data.docs[index];
                            return InkWell(
                              child: HobbyBar(
                                snapshot: item,
                              ),
                              onTap: () async {
                                await UserHandler.instance
                                    .addHobby(hobbyId: item.id);
                                _searchBarController.clear();
                                setState(() => searchQuery = '');
                              },
                            );
                          },
                          itemCount: snapshot.data.docs.length,
                          controller: _controller,
                        );
                      }
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
