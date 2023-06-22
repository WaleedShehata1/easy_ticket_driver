part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class Loading extends AppState {}

class BusSuccess extends AppState {
  final Bus? busList;
  BusSuccess(this.busList);
}

class BusError extends AppState {
  final String error;
  BusError(this.error);
}
