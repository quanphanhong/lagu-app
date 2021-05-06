import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart';

class FriendItem extends StatelessWidget {
  int _index;
  int _avatarType = 0;
  String _avatar = 'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png';
  String _name = 'default';

  FriendItem.limited(this._index);
  FriendItem.full(this._index, this._avatar, this._name);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
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
              child: Text(
                _name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
      decoration: new BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.black,
          blurRadius: 5.0,
        ),]
      ),
    );
  }
  
}