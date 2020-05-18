part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class InitialLocationState extends LocationState {}

class ErrorLocationState extends LocationState {
  final String _message;

  String get message => _message;

  ErrorLocationState(this._message);
}

class GetStreamLocationState extends LocationState {
  final Stream<PositionRaw> _stream;

  Stream<PositionRaw> get stream => _stream;

  GetStreamLocationState(this._stream);
}