import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/list_detail_category/data/models/list_detail_category_model.dart';
import 'package:sadec_smart_city/shared/utils/navigation_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ListDetailCategoryCard extends StatefulWidget {
  const ListDetailCategoryCard({super.key, required this.detailCategory});

  final ListDetailCategoryModel detailCategory;

  @override
  State<ListDetailCategoryCard> createState() => _ListDetailCategoryCardState();
}

class _ListDetailCategoryCardState extends State<ListDetailCategoryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: _buildCard(context),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    final place = widget.detailCategory;
    final screenWidth = MediaQuery.of(context).size.width;
    final double titleFontSize =
        screenWidth >= 1024 ? 22 : (screenWidth >= 700 ? 20 : 18);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/logo_sdc.png'),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    place.groupName,
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 80,
              left: 16,
              right: 16,
              child: _buildBlurBlock(
                context: context,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.ten,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      place.diaChi ?? 'Đang cập nhật',
                      style: TextStyle(
                        color: colorScheme.onSurface.withValues(alpha: 0.7),
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 16,
              right: 16,
              child: GestureDetector(
                onTap:
                    () => NavigationHelper.handleDetailTapWithTableIdAnDetailId(
                      context,
                      tableId: widget.detailCategory.tableId,
                      detailId: widget.detailCategory.detailId,
                    ),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap:
                              () =>
                                  NavigationHelper.handleDetailTapWithTableIdAnDetailId(
                                    context,
                                    tableId: widget.detailCategory.tableId,
                                    detailId: widget.detailCategory.detailId,
                                  ),
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.7),
                              borderRadius: BorderRadius.circular(16),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 18,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Xem chi tiết",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Nút Bản đồ
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final url = Uri.parse(
                              'https://www.google.com/maps/search/?api=1&query=${widget.detailCategory.gpsLat},${widget.detailCategory.gpsLong}',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            } else {
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Không thể mở Google Maps'),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 40,
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.7),
                              borderRadius: BorderRadius.circular(24),
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black87,
                                  size: 18,
                                ),
                                SizedBox(width: 6),
                                Text(
                                  "Bản đồ",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlurBlock({
    required BuildContext context,
    required Widget child,
  }) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        ),
      ),
    );
  }
}
