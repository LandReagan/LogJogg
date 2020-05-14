import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class LocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartLocationEvent extends LocationEvent {}

class StopLocationEvent extends LocationEvent {}