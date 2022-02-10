import 'dart:io';

import 'package:flutter/material.dart';
import 'package:locationpractice/provider/great_place_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../widgets/location_input.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);
  static const routeName = "/add-place";

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  var  _selectImage = File('');

  void _saveFile()
  {
    if(_titleController.text.isEmpty || _selectImage==null){
      return;
    }else
      {
        Provider.of<GreatPlaceProvider>(context,listen: false).addPlace(_titleController.text,
            _selectImage);
        Navigator.of(context).pop();
      }
  }

  void _selectFile(File selectFile)
  {
   _selectImage = selectFile;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                children:   [
                  TextField(
                    decoration: const InputDecoration(label: Text('Title')),
                    controller: _titleController,
                  ),
                  const SizedBox(height: 12.0,),
                   ImageInput(_selectFile),
                  const SizedBox(height: 12.0,),
                  const LocationInput()
                ],
              ),
            ),
          )),
          RaisedButton.icon(
            onPressed: (){
              print('btn Pressed');
              _saveFile();
          },
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}
