import 'package:flutter/material.dart';

class CoverPhoto extends StatelessWidget {
  final String coverPhoto;
  CoverPhoto({@required this.coverPhoto});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: (coverPhoto != '')
              ? NetworkImage(coverPhoto)
              : AssetImage('assets/images/default-cover-photo.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white,
          width: 3.0,
        ),
      ),
    );
  }
}
