import 'package:flutter/material.dart';
import 'package:locationpractice/provider/great_place_provider.dart';
import 'package:locationpractice/widget/list_title_detail.dart';
import 'package:provider/provider.dart';

import 'add_place_screen.dart';
class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
          },
              icon: const Icon(
            Icons.add
          ))
        ],
      ),
      body:FutureBuilder(
        future: Provider.of<GreatPlaceProvider>(context,listen: false).fetchAndsetdata(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot)=>snapshot.connectionState==ConnectionState.waiting ? const Center(
          child: CircularProgressIndicator(),
        ):Consumer<GreatPlaceProvider>(child:const Center(
          child: Text('No Place Added'),
        ) ,builder: (ctx,greatPlace,ch)=>greatPlace.item.length<=0 ? ch! :ListView.builder(
          itemBuilder: (ctx,i)=>ListTileDetail(greatPlace.item[i].title,
              greatPlace.item[i].image),
          itemCount: greatPlace.item.length,
        )),
      )
    );
  }
}
