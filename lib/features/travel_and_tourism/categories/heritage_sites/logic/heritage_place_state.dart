part of 'heritage_place_cubit.dart';

@immutable
sealed class HeritagePlaceState {}

final class HeritagePlaceInitial extends HeritagePlaceState {}

class HeritagePlaceLoading extends HeritagePlaceState {}

class HeritagePlaceLoaded extends HeritagePlaceState {
  final List<TourismPlaceModel> heritagePlaces;
  final List<TourismPlaceModel> allHeritagePlaces;

  HeritagePlaceLoaded({
    required this.heritagePlaces,
    required this.allHeritagePlaces,
  });
}

class HeritagePlaceError extends HeritagePlaceState {
  final String message;

  HeritagePlaceError(this.message);
}
