import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/auth_service.dart';
import 'package:lagu_app/Screens/Explore/explore.dart';
import 'package:lagu_app/Screens/FriendList/friend_list.dart';
import 'package:lagu_app/Screens/MessageList/message_list.dart';
import 'package:lagu_app/Screens/Settings/settings.dart';
import 'package:lagu_app/Screens/UserDetail/user-detail.dart';

const _kPages = <String, IconData>{
  'Explore': Icons.map,
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
  int selectedIndex = 2;
  TabStyle tabStyle = TabStyle.reactCircle;
  List<Widget> listWidges = [
    Explore(),
    FriendList(),
    UserDetailScreen(
      userId: new AuthService().getCurrentUID(),
    ),
    MessageList(),
    Settings()
  ];

  bool checkIndexAvailable(index) {
    return index < listWidges.length && index >= 0;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: listWidges.length,
        initialIndex: 2,
        child: Scaffold(
          body: listWidges[selectedIndex],
          bottomNavigationBar: ConvexAppBar.badge(
            const <int, dynamic>{},
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
