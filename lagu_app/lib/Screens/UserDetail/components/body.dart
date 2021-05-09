import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/UserDetail/components/user-flexible-appbar.dart';

class Body extends StatelessWidget {
  TabStyle _tabStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(expandedHeight: screensize.height/4),
            pinned: true,
            floating: true,
          ),

          SliverFillRemaining(
            child: Container(
                child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                          height: 100,
                        ),
                        Text("hello hello hello hello hello")
                      ],
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}