import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helper/location_helper.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewImage;

  Future<void> _getCurrentLocation() async{
    final locationData = await Location().getLocation();
    final staticImageURL = LocationHelper.getLocation(longitude: locationData.latitude!,
        latitude: locationData.longitude!);
    setState(() {
      previewImage = staticImageURL;
    });
    print(locationData.longitude);
    print(locationData.latitude);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(width: 1 , color:  Colors.grey)),
          alignment: Alignment.center,
          child: previewImage==null ? const Text('No Location Choosen',textAlign: TextAlign.center,) :
          Image.network(previewImage!,
            fit: BoxFit.cover,
          width: double.infinity,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(onPressed: (){
              _getCurrentLocation();
            },
                icon: const Icon(Icons.location_on),
                textColor: Theme.of(context).primaryColor,
                label: const Text('Current Location')
            ),
            FlatButton.icon(onPressed: (){},
                icon: const Icon(Icons.map),
                textColor: Theme.of(context).primaryColor,
                label: const Text('Select on Map')
            ),
          ],
        )
      ],
    );
  }
}
