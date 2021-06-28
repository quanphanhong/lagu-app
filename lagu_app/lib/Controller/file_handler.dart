import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class FileHandler {
  static FileHandler instance = new FileHandler();

  Future<String> uploadFile(File file) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference reference = storage.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(file);

    String result = '';
    await uploadTask.then((res) async {
      await res.ref.getDownloadURL().then((url) {
        result = url;
      });
    }, onError: (err) {
      result = '';
    });

    return result;
  }

  Future<String> getImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile;

    pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    File file = File(pickedFile.path);

    if (file != null) {
      return await uploadFile(file);
    } else
      return '';
  }
}
