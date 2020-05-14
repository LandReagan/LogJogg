import 'dart:async';

import 'package:LogJogg/services/location/location.dart';
import 'package:LogJogg/services/location/location_event.dart';
import 'package:LogJogg/services/location/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  Geolocator _locator;
  LocationOptions _options = LocationOptions(
    accuracy: LocationAccuracy.best,
  );

  @override
  LocationState get initialState => LocationNotAvailable();

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is StopLocationEvent) {
      _locator = null;
      yield LocationNotAvailable();
    } else if (event is StartLocationEvent) {
      if (_locator == null) _locator = Geolocator();
      final Position position =
          await _locator.getCurrentPosition(desiredAccuracy: _options.accuracy);
      yield LocationAvailable(Location(position.longitude, position.latitude));
    }
  }

}