import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as systempath;

class ImageInput extends StatefulWidget {
   Function selectImage;
   ImageInput(this.selectImage);


  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
   File? _storedImage ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 170,
          decoration:
              BoxDecoration(border: Border.all(width: 1,
                  color: Colors.grey)
              ),
          alignment: Alignment.center,
          child: _storedImage!=null ?Image.file(_storedImage!,
            fit: BoxFit.cover,
          width: double.infinity,)
              :
          const Text('No Image Taken',textAlign: TextAlign.center,),
        ),
        const SizedBox(width: 12.0,),
        Expanded(
          child: FlatButton.icon(onPressed: (){
            _takeImage();
          },
              icon: const Icon(Icons.camera),
              textColor: Theme.of(context).primaryColor,
              label: const Text('Take Picture')),
        )
      ],
    );
  }

  Future<void> _takeImage() async{
    print('abds');
   final image =  await ImagePicker().pickImage(source: ImageSource.camera,
       maxHeight: 600);
   setState(() {
     _storedImage = File(image!.path);
   });
   final appDir = await systempath.getApplicationDocumentsDirectory();
   final fileName = path.basename(image!.path);
    final savedImage = await  File(image.path).copy('${appDir.path}/$fileName');
    print(appDir.path);
    widget.selectImage(savedImage);


  }
}
