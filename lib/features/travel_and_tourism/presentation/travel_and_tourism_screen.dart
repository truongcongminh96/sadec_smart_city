import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/logic/travel_and_tourism_cubit.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/widgets/matcha_theme_wrapper.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/widgets/travel_and_tourism_header.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/widgets/travel_and_tourism_item.dart';
import 'package:sadec_smart_city/shared/utils/overlay_style_helper.dart';

class TravelAndTourismScreen extends StatelessWidget {
  const TravelAndTourismScreen({super.key, required this.menuAppId});

  final int menuAppId;

  @override
  Widget build(BuildContext context) {
    return MatchaThemeWrapper(
      child: BlocProvider(
        create:
            (_) =>
                TravelAndTourismCubit(getIt())
                  ..fetchTravelAndTourism(menuAppId),
        child: TravelAndTourismView(menuAppId: menuAppId),
      ),
    );
  }
}

class TravelAndTourismView extends StatefulWidget {
  const TravelAndTourismView({super.key, required this.menuAppId});

  final int menuAppId;

  @override
  State<TravelAndTourismView> createState() => _TravelAndTourismViewState();
}

class _TravelAndTourismViewState extends State<TravelAndTourismView> {
  final scrollController = ScrollController();
  double scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        scrollOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getOverlayStyle(isDark),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: const TravelAndTourismHeader(),
          body: BlocBuilder<TravelAndTourismCubit, TravelAndTourismState>(
            builder: (context, state) {
              if (state is TravelAndTourismLoaded) {
                final items = state.travelAndTourism;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    int crossAxisCount =
                        width >= 1024 ? 4 : (width >= 700 ? 2 : 1);

                    return GridView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 200,
                      ),
                      itemCount: items.length,
                      itemBuilder: (_, index) {
                        return TravelAndTourismItem(
                          item: items[index],
                          scrollOffset: scrollOffset,
                        );
                      },
                    );
                  },
                );
              } else if (state is TravelAndTourismLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TravelAndTourismError) {
                return Center(
                  child: Text(
                    "Lỗi: ${state.message}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
