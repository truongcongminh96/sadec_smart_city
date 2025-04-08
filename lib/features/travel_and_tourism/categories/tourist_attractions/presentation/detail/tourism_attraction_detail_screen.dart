import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/logic/tourism_attraction_detail_cubit.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/presentation/detail/widgets/tourism_attraction_header.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/presentation/detail/widgets/tourism_attraction_image_slider.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/presentation/detail/widgets/tourism_attraction_tab_content.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/presentation/widgets/matcha_theme_wrapper.dart';

class TourismAttractionDetailScreen extends StatefulWidget {
  const TourismAttractionDetailScreen({
    super.key,
    required this.tableId,
    required this.detailId,
  });

  final int tableId;
  final int detailId;

  @override
  State<TourismAttractionDetailScreen> createState() =>
      _TourismAttractionDetailScreenState();
}

class _TourismAttractionDetailScreenState
    extends State<TourismAttractionDetailScreen> {
  int selectedImageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      setState(() {
        selectedImageIndex++;
      });
    });
  }

  void _onUserTapImage(int index) {
    setState(() {
      selectedImageIndex = index;
    });
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MatchaThemeWrapper(
      child: BlocProvider(
        create:
            (_) => TourismAttractionDetailCubit(getIt())
              ..loadDetailTourismAttraction(widget.tableId, widget.detailId),

        child: BlocBuilder<
          TourismAttractionDetailCubit,
          TourismAttractionDetailState
        >(
          builder: (context, state) {
            if (state is TourismAttractionDetailLoading) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is TourismAttractionDetailError) {
              return Scaffold(
                body: Center(child: Text('Lỗi: ${state.message}')),
              );
            } else if (state is TourismAttractionDetailLoaded) {
              final place = state.data;
              final images = state.images;
              final mappedFields = state.mappedFields;

              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: SafeArea(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    TourismAttractionImageSlider(
                                      images: images,
                                      selectedImageIndex: selectedImageIndex,
                                    ),
                                    const Positioned(
                                      top: 16,
                                      left: 16,
                                      child: BackButton(color: Colors.white),
                                    ),
                                    const Positioned(
                                      top: 16,
                                      right: 16,
                                      child: Icon(
                                        Icons.bookmark_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TourismAttractionHeader(place: place),
                                      const SizedBox(height: 12),
                                      SizedBox(
                                        height: 60,
                                        child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: images.length,
                                          itemBuilder: (_, index) {
                                            final isSelected =
                                                index ==
                                                (selectedImageIndex %
                                                    images.length);
                                            return GestureDetector(
                                              onTap:
                                                  () => _onUserTapImage(index),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border:
                                                      isSelected
                                                          ? Border.all(
                                                            color:
                                                                Colors
                                                                    .orangeAccent,
                                                            width: 2,
                                                          )
                                                          : null,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: FadeInImage.assetNetwork(
                                                    image:
                                                        images[index]
                                                            .linkHinhAnh,
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                    placeholder:
                                                        'assets/images/icon_thank_you.jpg',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (_, __) =>
                                                  const SizedBox(width: 8),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.5,
                                        child: TourismAttractionTabContent(
                                          gioiThieu: place.gioiThieu,
                                          mappedFields: mappedFields,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
