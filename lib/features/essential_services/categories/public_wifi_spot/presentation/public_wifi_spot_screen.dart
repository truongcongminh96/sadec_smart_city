import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/data/repositories/public_wifi_spot_repository.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/logic/public_wifi_spot_cubit.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/presentation/widgets/public_wifi_spot_card.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/presentation/widgets/public_wifi_spot_search_bar.dart';
import 'package:sadec_smart_city/shared/widgets/empty_state_widget.dart';

class PublicWifiSpotScreen extends StatefulWidget {
  const PublicWifiSpotScreen({super.key, required this.menuAppId});

  final int menuAppId;

  @override
  State<PublicWifiSpotScreen> createState() => _PublicWifiSpotScreenState();
}

class _PublicWifiSpotScreenState extends State<PublicWifiSpotScreen> {
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
              PublicWifiSpotCubit(getIt<PublicWifiSpotRepository>())
                ..loadPublicWifiSpots(widget.menuAppId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Điểm wifi công cộng'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Builder(
              builder:
                  (context) =>
                      PublicWifiSpotSearchBar(controller: _searchController),
            ),
          ),
        ),
        body: BlocBuilder<PublicWifiSpotCubit, PublicWifiSpotState>(
          builder: (context, state) {
            if (state is PublicWifiSpotLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PublicWifiSpotLoaded) {
              final publicWifiSpots = state.publicWifiSpots;
              if (publicWifiSpots.isEmpty) {
                return const EmptyStateWidget(
                  title: "Không có địa điểm nào khớp",
                  subtitle: "Hãy thử lại với từ khóa khác nhé!",
                );
              }
              return AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: publicWifiSpots.length,
                  itemBuilder: (context, index) {
                    final publicWifiSpot = publicWifiSpots[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: PublicWifiSpotCard(
                            publicWifiSpot: publicWifiSpot,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is PublicWifiSpotError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
