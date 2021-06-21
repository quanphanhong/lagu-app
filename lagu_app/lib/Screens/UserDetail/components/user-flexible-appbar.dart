import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lagu_app/Data/data.dart';
import 'package:lagu_app/Models/user.dart';

Widget buildCoverImage(String urlCover) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(urlCover), fit: BoxFit.cover),
    ),
  );
}

Widget buildUserName(String name) {
  return Text(
    name,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  );
}

Widget buildProfileImage(String urlImg, double border, double sizeAvt) {
  return Container(
    width: sizeAvt,
    height: sizeAvt,
    child: Center(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(urlImg),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(80),
            border: Border.all(
              color: Colors.white,
              width: border,
            )),
      ),
    ),
  );
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final User user;

  const CustomSliverAppBarDelegate(
      {@required this.expandedHeight, @required this.user});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final screenSize = MediaQuery.of(context).size;
    final avatarSize = 120;
    final top = expandedHeight - shrinkOffset - avatarSize / 2;

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
            top: top,
            left: screenSize.width / 2 - avatarSize / 2,
            child: Align(
              alignment: Alignment.center,
              child: buildFloating(shrinkOffset),
            )),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          title: Row(
            children: [
              buildProfileImage(user.profilePicture, 2.0, 40),
              SizedBox(
                width: 8,
              ),
              buildUserName(user.nickname),
            ],
          ),
          centerTitle: true,
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
      opacity: disappear(shrinkOffset),
      child: buildCoverImage(user.coverPhoto));

  Widget buildFloating(double shrinkOffset) => Opacity(
      opacity: disappear(shrinkOffset),
      child: Column(children: <Widget>[
        buildProfileImage(user.profilePicture, 10.0, 120),
        SizedBox(
          height: 10,
        ),
        buildUserName(user.nickname)
      ]));

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
