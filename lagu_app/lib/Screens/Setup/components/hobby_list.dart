import 'package:flutter/material.dart';
import 'package:lagu_app/Data/data.dart';
import 'package:lagu_app/Models/hobby.dart';
import 'package:mvc_application/view.dart';
import 'package:lagu_app/Screens/Setup/components/hobby_item.dart';

class HobbyList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => LanguageListState();

}

class LanguageListState extends StateMVC<HobbyList> {

  final hobbies = List.from(Data.hobbyList);

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
        itemCount: hobbies.length,
        itemBuilder: (BuildContext context, int index) => BuildItem(hobbies[index])
    );
  }
  Widget BuildItem(Hobby item){
    return Row(
      children: [
        Checkbox(value: item.state, onChanged: (value){
          setState((){
            item.state = value;
          });
        }),
        HobbyItem(item: item,),
      ],
    );
  }
}