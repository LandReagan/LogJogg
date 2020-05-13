import 'package:geolocator/geolocator.dart';


class LocationService {

  static final LocationAccuracy _accuracy = LocationAccuracy.best;

  static Future<Position> currentPosition() async {
    return await Geolocator().getCurrentPosition(desiredAccuracy: _accuracy);
  }
}