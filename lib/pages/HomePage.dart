import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatelessWidget {

  final String title;

  HomePage(this.title);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: LocationWidget(),
    );
  }
}

class LocationWidget extends StatefulWidget {
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {

  Position _position;

  void _updatePosition() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    _position = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    setState(() {
      //print('pos!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("LAT: ${_position?.latitude ?? "XX"}, LNG: ${_position?.longitude ?? "XX"}"),
        FlatButton(
          child: Text('GET LOCATION'),
          onPressed: () {
            _updatePosition();
          },
        )
      ],
    );
  }
}