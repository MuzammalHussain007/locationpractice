import 'dart:io';

import 'package:flutter/material.dart';
import 'package:locationpractice/helper/de_helper.dart';

import '../modal/place_modal.dart';

class GreatPlaceProvider extends ChangeNotifier
{
  List<PlaceModal> _list = [];

  List<PlaceModal> get item{
    return [..._list];
}
 void addPlace(String title , File pickedImage){
    final newPlace  = PlaceModal(id: DateTime.now().toString(),
        name: title,
        image: pickedImage,
        title: title,
        location:null);
    _list.add(newPlace);
    notifyListeners();
    DatabaseHelper.insert('user_places',
    {
      'title': newPlace.title,
      'id':newPlace.id,
      'image':newPlace.image.path
    }
    );
  }


  Future<void> fetchAndsetdata() async
  {

    final dataList = await DatabaseHelper.fetchAndShow("user_places");
    _list = dataList.map((e) => PlaceModal(id: e['id'],
        image: File(e['image']),
        location: null,
        title: e['id'],
        name: null))
        .toList();
    notifyListeners();

  }

  
}