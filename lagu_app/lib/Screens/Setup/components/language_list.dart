import 'package:flutter/material.dart';
import 'package:lagu_app/Data/data.dart';
import 'package:lagu_app/Models/language.dart';
import 'package:mvc_application/view.dart';
import 'package:lagu_app/Screens/Setup/components/language_item.dart';

class LanguageList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => LanguageListState();

}

class LanguageListState extends StateMVC<LanguageList> {

  final languages = List.from(Data.languageList);
  List<String> star = List.from(Data.star);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: 150.0,
            maxHeight: 350.0,
          ),
          child: Row(
            children: <Widget>[
              Expanded(child: BuildLanguageList())
            ],
          ),
        )
    );
  }
  Widget BuildLanguageList(){
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) => BuildItem(languages[index])
    );
  }
  Widget BuildItem(Language item){
    return Row(
      children: [
        Checkbox(value: item.state, onChanged: (value){
          setState((){
            item.state = value;
          });
        }),
        LanguageItem(item: item,),
        DropdownButton(
          value: item.languageStar,
          onChanged: (String newValue){
            setState(() {item.languageStar = newValue;});
    },
          items: star.map<DropdownMenuItem<String>>((String value){
            return DropdownMenuItem<String>(
                value: value,
                child: Text(value));
          }).toList(),
        )
      ],
    );
  }
}