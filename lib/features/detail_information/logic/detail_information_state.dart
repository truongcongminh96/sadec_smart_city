part of 'detail_information_cubit.dart';

@immutable
sealed class DetailInformationState {}

final class DetailInformationInitial extends DetailInformationState {}

class DetailInformationLoading extends DetailInformationState {}

class DetailInformationLoaded extends DetailInformationState {
  final DetailInformationModel data;
  final Map<String, String?> mappedFields;
  final List<DetailInformationImageModel> images;

  DetailInformationLoaded({
    required this.data,
    required this.mappedFields,
    required this.images,
  });
}

class DetailInformationError extends DetailInformationState {
  final String message;

  DetailInformationError({required this.message});
}
