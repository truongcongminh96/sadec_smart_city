part of 'tourism_attraction_cubit.dart';

@immutable
sealed class TourismAttractionState {}

final class TourismAttractionInitial extends TourismAttractionState {}

class TourismAttractionLoading extends TourismAttractionState {}

class TourismAttractionLoaded extends TourismAttractionState {
  final List<TourismPlaceModel> tourismAttractions;
  final List<TourismPlaceModel> allTourismAttractions;

  TourismAttractionLoaded({
    required this.tourismAttractions,
    required this.allTourismAttractions,
  });
}

class TourismAttractionError extends TourismAttractionState {
  final String message;

  TourismAttractionError(this.message);
}
