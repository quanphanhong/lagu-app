import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lagu_app/const.dart';

class LoadingScreen extends StatelessWidget {
  final double loadingSize;
  LoadingScreen({this.loadingSize = 50.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCubeGrid(
        color: themeColor,
        size: loadingSize,
      ),
    );
  }
}
