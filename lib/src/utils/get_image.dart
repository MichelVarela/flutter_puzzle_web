import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> getImage() async {
  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image == null) return;
  final img = Image.memory(await image.readAsBytes());
  print(img);
}
