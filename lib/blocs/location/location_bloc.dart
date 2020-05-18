import 'dart:async';
import 'package:LogJogg/model/position_raw.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  Geolocator _locator;

  @override
  LocationState get initialState => InitialLocationState();
  
  Stream<PositionRaw> _getLocationStream(Stream<Position> positions) {
    return positions.map((position) {
      // todo: update the map function according to PositionRaw class improvements
      var positionRaw = PositionRaw(
          position.timestamp,
          position.longitude,
          position.latitude
      );
      return positionRaw;
    });
  }

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    yield InitialLocationState();
    try {
      _locator = Geolocator();
    } on Error {
      yield ErrorLocationState('Error while initializing geolocation.');
    }
    if (event is LocationStartEvent) {
      yield GetStreamLocationState(
        _getLocationStream(
          _locator.getPositionStream()
        )
      );
    }
  }
}
