import 'dart:io';

import 'package:chat_app/data/image_picker_repository.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerLocalImpl extends ImagePickerRepository {
  @override
  Future<File> pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery, maxWidth: 400);
    return File(pickedFile.path);
  }
}
