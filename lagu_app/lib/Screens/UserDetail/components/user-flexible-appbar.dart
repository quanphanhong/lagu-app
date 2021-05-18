import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lagu_app/Data/data.dart';
import 'package:lagu_app/Models/user.dart';

Widget BuildCoverImage(String urlCover)
{
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(urlCover),
        fit: BoxFit.cover
      ),
    ),
  );
}

Widget BuildUserName(String name){
  return Text(
    name,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  );
}

Widget BuildProfileImage(String urlImg, double border, double sizeAvt){
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
            )
        ),
      ),
    ),
  );
}


class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final User user;

  const CustomSliverAppBarDelegate({
    @required this.expandedHeight,
    @required this.user
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final screensize = MediaQuery.of(context).size;
    final sizeAvartar = 120;
    final top = expandedHeight - shrinkOffset - sizeAvartar / 2;

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        BuildBackground(shrinkOffset),
        BuildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: screensize.width/2 - sizeAvartar/2,
          child: Align(
            alignment: Alignment.center,
            child: BuildFloating(shrinkOffset),
          )
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget BuildAppBar(double shrinkOffset) => Opacity(
    opacity: appear(shrinkOffset),
    child: AppBar(
      title: Row(
        children: [
          BuildProfileImage(user.urlAvatar, 2.0, 40),
          SizedBox(width: 8,),
          BuildUserName(user.nickName),
        ],
      ),
      centerTitle: true,
    ),
  );

  Widget BuildBackground(double shrinkOffset) => Opacity(
    opacity: disappear(shrinkOffset),
    child: BuildCoverImage(user.background)
  );

  Widget BuildFloating(double shrinkOffset) => Opacity(
    opacity: disappear(shrinkOffset),
    child: Column(
      children: <Widget>[
        BuildProfileImage(user.urlAvatar, 10.0, 120),
        SizedBox(height: 10,),
        BuildUserName(user.nickName)
      ]
    )
  );


  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}