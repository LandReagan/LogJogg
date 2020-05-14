import 'package:equatable/equatable.dart';

class Location extends Equatable{
  final double longitude;
  final double latitude;

  Location(this.longitude, this.latitude);

  @override
  List<Object> get props => [longitude, latitude];
}