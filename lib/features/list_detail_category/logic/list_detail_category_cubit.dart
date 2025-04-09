import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sadec_smart_city/features/list_detail_category/data/models/list_detail_category_model.dart';
import 'package:sadec_smart_city/features/list_detail_category/data/repository/list_detail_category_repository.dart';

part 'list_detail_category_state.dart';

class ListDetailCategoryCubit extends Cubit<ListDetailCategoryState> {
  ListDetailCategoryCubit(this._repository)
    : super(ListDetailCategoryInitial());

  final ListDetailCategoryRepository _repository;

  Future<void> loadListDetailCategory(int menuAppId) async {
    emit(ListDetailCategoryLoading());
    try {
      final listDetailCategory = await _repository.fetchListDetailCategory(
        menuAppId,
      );
      emit(
        ListDetailCategoryLoaded(
          listDetailCategory: listDetailCategory,
          allListDetailCategory: listDetailCategory,
        ),
      );
    } catch (e) {
      emit(ListDetailCategoryError(e.toString()));
    }
  }

  void searchListDetailCategory(String query) {
    if (state is ListDetailCategoryLoaded) {
      final allListDetailCategory =
          (state as ListDetailCategoryLoaded).allListDetailCategory;
      final filteredDetailCategory =
          allListDetailCategory.where((listCategory) {
            final lowerQuery = query.toLowerCase();
            return listCategory.ten.toLowerCase().contains(lowerQuery) ||
                (listCategory.diaChi != null &&
                    listCategory.diaChi!.toLowerCase().contains(lowerQuery)) ||
                (listCategory.sdt != null &&
                    listCategory.sdt!.contains(lowerQuery));
          }).toList();

      emit(
        ListDetailCategoryLoaded(
          listDetailCategory: filteredDetailCategory,
          allListDetailCategory: allListDetailCategory,
        ),
      );
    }
  }
}
