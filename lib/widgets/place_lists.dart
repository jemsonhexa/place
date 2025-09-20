import 'package:flutter/material.dart';
import 'package:places/models/place_model.dart';
import 'package:places/views/place_detail.dart';

class PlaceLists extends StatelessWidget {
  final List<PlaceModel> places;
  const PlaceLists({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          "No Place",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: FileImage(places[index].image),
            ),
          ),
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) {
                  return PlaceDetail(place: places[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
