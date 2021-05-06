import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart';

class FriendItem extends StatelessWidget {
  int _index;
  int _avatarType = 0;
  String _avatar = 'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png';
  String _name = 'default';
  String _description = 'this is a description';

  FriendItem.limited(this._index);
  FriendItem.full(this._index, this._avatar, this._name);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(50.0)),
                  border: Border.all(color: const Color(0xFF28324E)),
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: _avatarType == 1 ? new NetworkImage(
                        _avatar,
                      ) : new AssetImage('assets/images/default-avatar.png')
                  )
              ),
              width: 60,
              height: 60,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      _name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    margin: EdgeInsets.only(bottom: 5),
                  ),
                  Container(
                    child: Text(
                      _description,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ]
              )
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Message',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
}