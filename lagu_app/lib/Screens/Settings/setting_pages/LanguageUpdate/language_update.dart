import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/language_handler.dart';
import 'package:lagu_app/Screens/Settings/components/language_update_button.dart';
import 'package:lagu_app/Screens/Settings/setting_pages/LanguageUpdate/components/language_bar.dart';
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
          (searchQuery == '')
              ? buildSelectedLanguagesWidget(context)
              : buildSearchResultWidget()
        ],
      ),
    );
  }

  Widget buildSelectedLanguagesWidget(BuildContext context) {
    return Flexible(
      child: StreamBuilder(
        stream: LanguageHandler.instance.languageStream(),
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
                  child: LanguageBar(
                    languageSnapshot: item,
                    isSearchResult: false,
                  ),
                  onDismissed: (direction) async {
                    LanguageHandler.instance.deleteLanguage(item.id);
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
        stream: LanguageHandler.instance.allLanguageStream(query: searchQuery),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold();
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, index) {
                final item = snapshot.data.docs[index];
                return InkWell(
                  child: LanguageBar(
                    languageSnapshot: item,
                    isSearchResult: true,
                  ),
                  onTap: () async {
                    LanguageHandler.instance.addLanguage(languageId: item.id);
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
  }
}
