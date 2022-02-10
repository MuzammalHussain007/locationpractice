import 'dart:io';

import 'package:flutter/material.dart';

class ListTileDetail extends StatelessWidget {

  String _title;
  File _imageFile;
  ListTileDetail(this._title,this._imageFile);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(
        backgroundImage:FileImage(_imageFile),
      ),
      title: Text(_title),
      onTap: (){
      },
    );
  }
}
