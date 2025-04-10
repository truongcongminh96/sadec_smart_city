part of 'heritage_place_detail_cubit.dart';

@immutable
sealed class HeritagePlaceDetailState {}

final class HeritagePlaceDetailInitial extends HeritagePlaceDetailState {}

class HeritagePlaceDetailLoading extends HeritagePlaceDetailState {}

class HeritagePlaceDetailLoaded extends HeritagePlaceDetailState {
  final TourismPlaceDetailModel data;
  final Map<String, String?> mappedFields;
  final List<TourismPlaceImageModel> images;

  HeritagePlaceDetailLoaded({
    required this.data,
    required this.mappedFields,
    required this.images,
  });
}

class HeritagePlaceDetailError extends HeritagePlaceDetailState {
  final String message;

  HeritagePlaceDetailError({required this.message});
}
