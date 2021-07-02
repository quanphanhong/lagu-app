import 'package:flutter/material.dart';
import 'package:lagu_app/Controller/file_handler.dart';

class CoverPhotoUpdate extends StatefulWidget {
  final ValueChanged<String> onChanged;
  CoverPhotoState _coverPhotoState;

  CoverPhotoUpdate({this.onChanged});

  setCoverPhoto(String url) => _coverPhotoState.setCoverPhoto(url);

  @override
  State<StatefulWidget> createState() {
    _coverPhotoState = CoverPhotoState(onChanged: onChanged);
    return _coverPhotoState;
  }
}

class CoverPhotoState extends State<CoverPhotoUpdate> {
  String coverPhoto = '';
  final ValueChanged<String> onChanged;

  CoverPhotoState({this.onChanged});

  setCoverPhoto(String url) => setState(() => coverPhoto = url);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: (coverPhoto != '')
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
