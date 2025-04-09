part of 'sub_category_service_cubit.dart';

@immutable
sealed class SubCategoryServiceState {}

final class SubCategoryServiceInitial extends SubCategoryServiceState {}

class SubCategoryServiceLoading extends SubCategoryServiceState {}

class SubCategoryServiceLoaded extends SubCategoryServiceState {
  final List<CategoryServiceModel> allOtherEssentialServices;

  SubCategoryServiceLoaded({required this.allOtherEssentialServices});
}

class SubCategoryServiceError extends SubCategoryServiceState {
  final String message;

  SubCategoryServiceError(this.message);
}
