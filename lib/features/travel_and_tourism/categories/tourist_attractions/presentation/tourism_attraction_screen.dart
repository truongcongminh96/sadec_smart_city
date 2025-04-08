import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/logic/tourism_attraction_cubit.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/presentation/widgets/tourism_attraction_app_bar.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/presentation/widgets/tourism_attraction_card.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/presentation/widgets/tourism_attraction_search.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/widgets/matcha_theme_wrapper.dart';
import 'package:sadec_smart_city/shared/widgets/empty_state_widget.dart';

class TourismAttractionScreen extends StatelessWidget {
  const TourismAttractionScreen({super.key, required this.menuAppId});

  final int menuAppId;

  @override
  Widget build(BuildContext context) {
    return MatchaThemeWrapper(
      child: BlocProvider(
        create:
            (_) =>
                TourismAttractionCubit(getIt())
                  ..loadTourismAttractions(menuAppId),
        child: const TourismAttractionView(),
      ),
    );
  }
}

class TourismAttractionView extends StatefulWidget {
  const TourismAttractionView({super.key});

  @override
  State<TourismAttractionView> createState() => _TourismAttractionViewState();
}

class _TourismAttractionViewState extends State<TourismAttractionView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const TourismAttractionAppBar(),
      body: Column(
        children: [
          const TourismAttractionSearch(),
          const SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<TourismAttractionCubit, TourismAttractionState>(
              builder: (context, state) {
                if (state is TourismAttractionLoaded) {
                  final places = state.tourismAttractions;

                  if (places.isEmpty) {
                    return const EmptyStateWidget(
                      title: "Không có địa điểm nào khớp",
                      subtitle: "Hãy thử lại với từ khóa khác nhé!",
                    );
                  }

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;
                      final crossAxisCount =
                          width >= 1024 ? 4 : (width >= 700 ? 2 : 1);

                      return GridView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          mainAxisExtent: 260,
                        ),
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          return TourismAttractionCard(place: places[index]);
                        },
                      );
                    },
                  );
                } else if (state is TourismAttractionLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TourismAttractionError) {
                  return Center(child: Text("Lỗi: ${state.message}"));
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
