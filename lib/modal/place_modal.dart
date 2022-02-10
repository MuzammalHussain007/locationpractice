import 'dart:io';

import 'package:locationpractice/modal/place_location_modal.dart';

class PlaceModal {
  final String id;
  final String? name;
  final String title;
  final PlaceLocationModal? location ;
  final File image;

  PlaceModal({
    required this.id,
    required this.name,
    required this.image,
    required this.title,
    required this.location
});
}