part of 'location_bloc.dart';

/// Bloc events are geolocation start and stop, and position updates (from
/// sensors)

@immutable
abstract class LocationEvent {}

class LocationStartEvent extends LocationEvent {}

class LocationStopEvent extends LocationEvent {}
