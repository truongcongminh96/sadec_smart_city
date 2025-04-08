part of 'tourism_attraction_detail_cubit.dart';

@immutable
sealed class TourismAttractionDetailState {}

final class TourismAttractionDetailInitial
    extends TourismAttractionDetailState {}

class TourismAttractionDetailLoading extends TourismAttractionDetailState {}

class TourismAttractionDetailLoaded extends TourismAttractionDetailState {
  final TourismPlaceDetailModel data;
  final Map<String, String?> mappedFields;
  final List<TourismPlaceImageModel> images;

  TourismAttractionDetailLoaded({
    required this.data,
    required this.mappedFields,
    required this.images,
  });
}

class TourismAttractionDetailError extends TourismAttractionDetailState {
  final String message;

  TourismAttractionDetailError({required this.message});
}
