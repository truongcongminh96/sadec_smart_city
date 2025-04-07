part of 'travel_and_tourism_cubit.dart';

@immutable
sealed class TravelAndTourismState {}

final class TravelAndTourismInitial extends TravelAndTourismState {}

class TravelAndTourismLoading extends TravelAndTourismState {}

class TravelAndTourismLoaded extends TravelAndTourismState {
  final List<TravelAndTourismModel> travelAndTourism;

  TravelAndTourismLoaded({required this.travelAndTourism});
}

class TravelAndTourismError extends TravelAndTourismState {
  final String message;

  TravelAndTourismError(this.message);
}
