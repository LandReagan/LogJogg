import 'dart:async';

import 'package:flutter/material.dart';

import 'package:LogJogg/services/LocationService.dart';
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

  StreamController<Position> _positionsController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StreamBuilder(
          stream: LocationService.positions,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            return Text("LAT: ${snapshot.data?.latitude ?? "XX"}, LNG: ${snapshot.data?.longitude ?? "XX"}");
          },
        ),
      ],
    );
  }
}