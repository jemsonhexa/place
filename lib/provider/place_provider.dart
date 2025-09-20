import 'dart:io';

import 'package:flutter_riverpod/legacy.dart';
import 'package:places/models/place_model.dart';

class UserPlaceNotifier extends StateNotifier<List<PlaceModel>> {
  UserPlaceNotifier() : super(const []); //must be empty

  void addPlaces(String title, File image) {
    final newPlace = PlaceModel(title: title, image: image);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<UserPlaceNotifier, List<PlaceModel>>(
      (ref) => UserPlaceNotifier(),
    );
