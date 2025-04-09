import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/detail_information/logic/detail_information_cubit.dart';
import 'package:sadec_smart_city/features/detail_information/presentation/matcha_theme_wrapper.dart';
import 'package:sadec_smart_city/features/detail_information/presentation/widgets/detail_information_header.dart';
import 'package:sadec_smart_city/features/detail_information/presentation/widgets/detail_information_image_slider.dart';
import 'package:sadec_smart_city/features/detail_information/presentation/widgets/detail_information_tab_content.dart';

class DetailInformationScreen extends StatefulWidget {
  const DetailInformationScreen({
    super.key,
    required this.tableId,
    required this.detailId,
  });

  final int tableId;
  final int detailId;

  @override
  State<DetailInformationScreen> createState() =>
      _DetailInformationScreenState();
}

class _DetailInformationScreenState extends State<DetailInformationScreen> {
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
            (_) =>
                DetailInformationCubit(getIt())
                  ..loadDetailInformationPlace(widget.tableId, widget.detailId),

        child: BlocBuilder<DetailInformationCubit, DetailInformationState>(
          builder: (context, state) {
            if (state is DetailInformationLoading) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is DetailInformationError) {
              return Scaffold(
                body: Center(child: Text('Lỗi: ${state.message}')),
              );
            } else if (state is DetailInformationLoaded) {
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
                                    images.isNotEmpty
                                        ? DetailInformationImageSlider(
                                      images: images,
                                      selectedImageIndex: selectedImageIndex,
                                    )
                                        : Container(
                                      height: 200,
                                      color: Colors.grey[200],
                                      child: const Center(
                                        child: Text('Không có hình ảnh'),
                                      ),
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
                                      DetailInformationHeader(place: place),
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
                                        child: DetailInformationTabContent(
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
