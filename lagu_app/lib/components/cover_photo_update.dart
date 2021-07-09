import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/file_handler.dart';

// ignore: must_be_immutable
class CoverPhotoUpdate extends StatefulWidget {
  final ValueChanged<String> onChanged;
  String coverPhoto = '';

  CoverPhotoUpdate({this.onChanged, this.coverPhoto});

  @override
  State<StatefulWidget> createState() =>
      CoverPhotoState(onChanged: onChanged, coverPhoto: coverPhoto);
}

class CoverPhotoState extends State<CoverPhotoUpdate> {
  String coverPhoto = '';
  final ValueChanged<String> onChanged;

  CoverPhotoState({this.onChanged, this.coverPhoto});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: (coverPhoto != null && coverPhoto != '')
                    ? NetworkImage(coverPhoto)
                    : AssetImage('assets/images/default-cover-photo.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(80),
              border: Border.all(
                color: Colors.white,
                width: 10.0,
              ))),
      onTap: () {
        FileHandler.instance
            .getImage()
            .then((url) => setState(() => {coverPhoto = url, onChanged(url)}));
      },
    );
  }
}
