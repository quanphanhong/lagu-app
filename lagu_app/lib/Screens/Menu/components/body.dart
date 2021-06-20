import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/UserDetail/user-detail.dart';

const _kPages = <String, IconData>{
  'discover': Icons.map,
  'friends': Icons.people,
  'add': Icons.apps,
  'message': Icons.message,
  'home': Icons.home,
};


class Body extends StatelessWidget {
  int selectedIndex = 0;
  TabStyle tabStyle = TabStyle.reactCircle;
  List<Widget> listWidges = [UserDetailScreen()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return DefaultTabController(
        length: 5,
        initialIndex: 2,
        child: Scaffold(
          body: listWidges[selectedIndex],

          bottomNavigationBar: ConvexAppBar.badge (
            const <int, dynamic>{3: '99+'},
            style: tabStyle,
            items: <TabItem>[
              for(final entry in _kPages.entries)
                TabItem(icon: entry.value, title: entry.key),
            ],
            onTap: onItemTapped,
          ),
        )
    );
  }
  void onItemTapped(int index){
      selectedIndex = index;
  }
}