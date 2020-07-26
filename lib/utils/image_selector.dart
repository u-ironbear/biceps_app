import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImageSelector {
  Future<File> selectAvatarImage() async {
    var pickedImage = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxHeight: 150,
      maxWidth: 150,
      imageQuality: 50,
    );
    return File(pickedImage.path);
  }

  Future<File> selectUserPhoto() async {
    var pickedPhoto = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    return File(pickedPhoto.path);
  }

  Future<File> selectCameraPhoto() async {
    var pickedShot = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    return File(pickedShot.path);
  }
}
