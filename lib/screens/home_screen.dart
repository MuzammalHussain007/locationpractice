import 'package:flutter/material.dart';
import 'package:locationpractice/provider/great_place_provider.dart';
import 'package:locationpractice/screens/add_place_screen.dart';
import 'package:locationpractice/screens/place_list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>GreatPlaceProvider())
      ],
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: const PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName:(_)=>const AddPlaceScreen(),
        },
      ),
    );
  }
}
