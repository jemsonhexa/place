import 'package:flutter/material.dart';

import 'package:places/models/place_model.dart';

class PlaceDetail extends StatelessWidget {
  const PlaceDetail({super.key, required this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
        children: [
          //botttom most widget
          Image.file(
            place.image,
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
