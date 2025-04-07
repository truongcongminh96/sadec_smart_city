import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/logic/heritage_place_cubit.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/presentation/widgets/heritage_app_bar.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/presentation/widgets/heritage_place_search.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/presentation/widgets/heritage_place_card.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/widgets/matcha_theme_wrapper.dart';
import 'package:sadec_smart_city/shared/widgets/empty_state_widget.dart';

class HeritagePlacesScreen extends StatelessWidget {
  const HeritagePlacesScreen({super.key, required this.menuAppId});

  final int menuAppId;

  @override
  Widget build(BuildContext context) {
    return MatchaThemeWrapper(
      child: BlocProvider(
        create:
            (_) => HeritagePlaceCubit(getIt())..loadHeritagePlaces(menuAppId),
        child: const HeritagePlacesView(),
      ),
    );
  }
}

class HeritagePlacesView extends StatefulWidget {
  const HeritagePlacesView({super.key});

  @override
  State<HeritagePlacesView> createState() => _HeritagePlacesViewState();
}

class _HeritagePlacesViewState extends State<HeritagePlacesView> {
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
      appBar: const HeritageAppBar(),
      body: Column(
        children: [
          const HeritagePlaceSearch(),
          const SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<HeritagePlaceCubit, HeritagePlaceState>(
              builder: (context, state) {
                if (state is HeritagePlaceLoaded) {
                  final places = state.heritagePlaces;

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
                          return HeritagePlaceCard(place: places[index]);
                        },
                      );
                    },
                  );
                } else if (state is HeritagePlaceLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HeritagePlaceError) {
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
