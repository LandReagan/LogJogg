import 'package:equatable/equatable.dart';

class PositionRaw {

  final DateTime _timestamp;
  final double _longitude;
  final double _latitude;
  double _accuracy;
  double _altitude;
  double _heading;
  double _speed;
  double _speedAccuracy;

  PositionRaw(this._timestamp, this._longitude, this._latitude) {

  }

  PositionRaw.stall(): _timestamp = DateTime.fromMicrosecondsSinceEpoch(0), _longitude = 0, _latitude = 0;

  double get longitude => _longitude;
  double get latitude => _latitude;
  DateTime get timestamp => _timestamp;

  @override
  List<Object> get props => [_longitude, _latitude];
}
