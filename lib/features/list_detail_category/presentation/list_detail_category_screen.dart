import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/category_services/data/models/category_service_model.dart';
import 'package:sadec_smart_city/features/list_detail_category/data/repository/list_detail_category_repository.dart';
import 'package:sadec_smart_city/features/list_detail_category/logic/list_detail_category_cubit.dart';
import 'package:sadec_smart_city/features/list_detail_category/presentation/widgets/list_detail_category_app_bar.dart';
import 'package:sadec_smart_city/features/list_detail_category/presentation/widgets/list_detail_category_card.dart';
import 'package:sadec_smart_city/shared/widgets/empty_state_widget.dart';

class ListDetailCategoryScreen extends StatefulWidget {
  const ListDetailCategoryScreen({super.key, required this.categoryService});

  final CategoryServiceModel categoryService;

  @override
  State<ListDetailCategoryScreen> createState() =>
      _ListDetailCategoryScreenState();
}

class _ListDetailCategoryScreenState extends State<ListDetailCategoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              ListDetailCategoryCubit(getIt<ListDetailCategoryRepository>())
                ..loadListDetailCategory(widget.categoryService.menuAppId),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryService.ten),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Builder(
              builder:
                  (context) =>
                      ListDetailCategoryAppBar(controller: _searchController),
            ),
          ),
        ),
        body: BlocBuilder<ListDetailCategoryCubit, ListDetailCategoryState>(
          builder: (context, state) {
            if (state is ListDetailCategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ListDetailCategoryLoaded) {
              final listDetailCategory = state.listDetailCategory;
              if (listDetailCategory.isEmpty) {
                return const EmptyStateWidget(
                  title: "Không có địa điểm nào khớp",
                  subtitle: "Hãy thử lại với từ khóa khác nhé!",
                );
              }
              return AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: listDetailCategory.length,
                  itemBuilder: (context, index) {
                    final detailCategory = listDetailCategory[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: ListDetailCategoryCard(
                            detailCategory: detailCategory,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is ListDetailCategoryError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
