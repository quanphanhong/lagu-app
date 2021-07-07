import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/Settings/components/language_update_button.dart';
import 'package:lagu_app/components/loading_screen.dart';
import 'package:lagu_app/components/search_bar.dart';

class LanguageUpdate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguageUpdateState();
}

class LanguageUpdateState extends State<LanguageUpdate> {
  ScrollController _controller = new ScrollController();
  TextEditingController _searchBarController = new TextEditingController();

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          LanguageUpdateButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SearchBar(
            controller: _searchBarController,
            onChanged: (value) {
              setState(() => searchQuery = value);
            },
          ),
          // (searchQuery == '')
          //     ? buildSelectedHobbiesWidget(context)
          //     : buildSearchResultWidget()
        ],
      ),
    );
  }

  /*Widget buildSelectedHobbiesWidget(BuildContext context) {
    return Flexible(
      child: StreamBuilder(
        stream: HobbyHandler.instance.hobbyStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: LoadingScreen());
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, index) {
                final item = snapshot.data.docs[index];
                return Dismissible(
                  key: Key(item['name']),
                  child: HobbyBar(habitSnapshot: item),
                  onDismissed: (direction) async {
                    HobbyHandler.instance.deleteHobby(item.id);
                  },
                );
              },
              itemCount: snapshot.data.docs.length,
              controller: _controller,
            );
          }
        },
      ),
    );
  }

  Widget buildSearchResultWidget() {
    return Flexible(
      child: StreamBuilder(
        stream: HobbyHandler.instance.allHobbyStream(query: searchQuery),
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
                    habitSnapshot: item,
                  ),
                  onTap: () async {
                    HobbyHandler.instance.addHobby(hobbyId: item.id);
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
    );
  }*/
}
