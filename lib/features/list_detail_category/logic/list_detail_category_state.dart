part of 'list_detail_category_cubit.dart';

@immutable
sealed class ListDetailCategoryState {}

final class ListDetailCategoryInitial extends ListDetailCategoryState {}

class ListDetailCategoryLoading extends ListDetailCategoryState {}

class ListDetailCategoryLoaded extends ListDetailCategoryState {
  final List<ListDetailCategoryModel> listDetailCategory;
  final List<ListDetailCategoryModel> allListDetailCategory;

  ListDetailCategoryLoaded({
    required this.listDetailCategory,
    required this.allListDetailCategory,
  });
}

class ListDetailCategoryError extends ListDetailCategoryState {
  final String message;

  ListDetailCategoryError(this.message);
}
