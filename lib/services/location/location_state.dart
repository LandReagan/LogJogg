import 'package:equatable/equatable.dart';

import 'package:LogJogg/services/location/location.dart';

class LocationState extends Equatable {

  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationNotAvailable extends LocationState {}

class LocationAvailable extends LocationState {
  final Location _location;

  const LocationAvailable(this._location);

  @override
  List<Object> get props => [_location];
}