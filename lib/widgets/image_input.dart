// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onSelctImg});

  final void Function(File file)
  onSelctImg; //to passs the image to parent function
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? selectedimg;
  void save() async {
    final image = ImagePicker();
    final pickedimg = await image.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
    );
    if (pickedimg == null) {
      return;
    }
    setState(() {
      selectedimg = File(pickedimg.path);
    });
    //once we capture image it will pass to function.
    widget.onSelctImg(selectedimg!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: save,
      label: Text("Take Photo"),
    );

    if (selectedimg != null) {
      content = GestureDetector(
        onTap: save,
        child: Image.file(
          selectedimg!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white60),
      ),
      alignment: Alignment.center,
      height: 150,
      width: double.infinity,
      child: content,
    );
  }
}
