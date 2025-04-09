part of 'category_service_cubit.dart';

sealed class CategoryServiceState {}

final class CategoryServiceInitial extends CategoryServiceState {}

final class CategoryServiceLoading extends CategoryServiceState {}

final class CategoryServiceLoaded extends CategoryServiceState {}

final class CategoryServiceError extends CategoryServiceState {
  final String message;

  CategoryServiceError(this.message);
}

class SubCategoryServiceLoaded extends CategoryServiceState {
  final List<CategoryServiceModel> subServices;

  SubCategoryServiceLoaded({required this.subServices});
}
