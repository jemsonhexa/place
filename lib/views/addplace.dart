import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/models/place_model.dart';
import 'package:places/provider/place_provider.dart';
import 'package:places/widgets/add_location.dart';
import 'package:places/widgets/image_input.dart';

final List<PlaceModel> addedPlaces = [];

class Addplace extends ConsumerStatefulWidget {
  const Addplace({super.key});

  @override
  ConsumerState<Addplace> createState() => _AddplaceState();
}

class _AddplaceState extends ConsumerState<Addplace> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController titleContoller = TextEditingController();
  File? selectedimg; //to get he imag which will be passed by child

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleContoller.dispose();
  }

  void save() {
    final enteredText = titleContoller.text;
    if (enteredText.isEmpty || selectedimg == null) {
      return;
    }
    ref
        .read(userPlaceProvider.notifier)
        .addPlaces(titleContoller.text, selectedimg!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add a new place")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: titleContoller,
                  ),
                  SizedBox(height: 10),
                  ImageInput(
                    onSelctImg: (image) {
                      selectedimg = image; //so when ever the image is picked in
                      //child widget ,through the function the img is passed to the parent which is here so the variable slectedimg will have img
                    },
                  ),
                  SizedBox(height: 10),
                  AddLocation(),
                  SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: save,
                    label: Text("Submit"),
                    icon: Icon(Icons.check),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
