import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/FriendList/friend_list.dart';
import 'package:lagu_app/Screens/MessageList/message_list.dart';
import 'package:lagu_app/Screens/Messaging/messaging.dart';
import 'package:lagu_app/Screens/UserDetail/user-detail.dart';

const _kPages = <String, IconData>{
  'Timeline': Icons.map,
  'Friends': Icons.people,
  '': Icons.account_circle,
  'Messages': Icons.message,
  'Settings': Icons.settings,
};

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedIndex = 0;
  TabStyle tabStyle = TabStyle.reactCircle;
  List<Widget> listWidges = [FriendList(), UserDetailScreen(), MessageList()];

  bool checkIndexAvailable(index) {
    return index < listWidges.length && index >= 0;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 5,
        initialIndex: 2,
        child: Scaffold(
          body: listWidges[selectedIndex],
          bottomNavigationBar: ConvexAppBar.badge(
            const <int, dynamic>{3: '99+'},
            style: tabStyle,
            items: <TabItem>[
              for (final entry in _kPages.entries)
                TabItem(icon: entry.value, title: entry.key),
            ],
            onTap: (index) {
              if (!checkIndexAvailable(index)) return;
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ));
  }
}
