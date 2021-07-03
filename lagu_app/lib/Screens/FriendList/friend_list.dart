import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagu_app/Screens/FriendList/components/friend_info_item_list.dart';
import 'package:lagu_app/Screens/FriendList/components/friend_request_button.dart';
import 'package:lagu_app/const.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FriendList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FriendListState();
}

class FriendListState extends State<FriendList> {
  String searchQuery = '';
  RefreshController _refreshController = new RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friend List'),
        centerTitle: true,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropMaterialHeader(
          color: themeColor,
        ),
        controller: _refreshController,
        onRefresh: () async {
          setState(() {});
          _refreshController.refreshCompleted();
        },
        child: Column(
          children: <Widget>[
            FriendRequestButton(parentBuildContext: context),
            Expanded(
              child: FriendItemList(),
            )
          ],
        ),
      ),
    );
  }
}
