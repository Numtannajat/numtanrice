import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Myservice extends StatefulWidget {
// การโยนค่าระหว่าง state
  final String name;
  Myservice({Key key, this.name}) : super(key: key);

  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
// Field
  String nameLogin;
  LocationData currentLocation;
// Method
  @override
  void initState() {
    super.initState();
    nameLogin = widget.name;
    findLocation();
  }


Future<void> findLocation() async { 

  currentLocation = await locationData();
 
    print(
      'Lat = ${currentLocation.latitude}, Lng = ${currentLocation.longitude}'
  );
}

Future<LocationData> locationData() async {
  var location = Location();
  try{
    return await location.getLocation();
  } on PlatformException catch(e) {
    if(e.code == 'PERMISSION_DENTED') {
      print('Permission_denied');
    }
    return null;
  }
}

  Widget myMap() {
    return GoogleMap(
        initialCameraPosition: CameraPosition(
      target: const LatLng(13.667708, 100.621809),
      zoom: 16.0,
    ));
  }

  Widget showNameLogin() {
    return Column(
      children: <Widget>[
        Text('Login by'),
        Text(nameLogin),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[showNameLogin()],
        title: Text('My Service'),
        backgroundColor: Colors.green.shade300,
      ),
      body: myMap(),
    );
  }
}
