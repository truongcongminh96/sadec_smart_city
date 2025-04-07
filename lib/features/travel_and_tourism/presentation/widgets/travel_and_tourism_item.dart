import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sadec_smart_city/core/theme/matcha_theme.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/data/models/travel_and_tourism_model.dart';
import 'package:sadec_smart_city/shared/utils/navigation_helper.dart';

class TravelAndTourismItem extends StatefulWidget {
  final TravelAndTourismModel item;
  final double scrollOffset;

  const TravelAndTourismItem({
    super.key,
    required this.item,
    required this.scrollOffset,
  });

  @override
  State<TravelAndTourismItem> createState() => _TravelAndTourismItemState();
}

class _TravelAndTourismItemState extends State<TravelAndTourismItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;
  late Animation<Offset> _buttonSlide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _controller.forward();
    });

    _buttonSlide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double yOffset = max(0, 20 - (widget.scrollOffset * 0.1));

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: Offset(0, yOffset),
            child: SlideTransition(position: _slide, child: _buildCard()),
          ),
        );
      },
    );
  }

  Widget _buildCard() {
    final item = widget.item;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/ditichdisansadec.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  errorBuilder:
                      (_, __, ___) => Container(
                        color:
                            Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                        height: 200,
                        child: const Center(child: Icon(Icons.image)),
                      ),
                ),
              ),
              Positioned(
                top: 12,
                left: 24,
                right: 24,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.surface.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          item.icon,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => Icon(
                                Icons.image,
                                size: 24,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item.ten,
                          style: MatchaTheme.titleStyle.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 24,
                right: 24,
                child: SlideTransition(
                  position: _buttonSlide,
                  child: GestureDetector(
                    onTap:
                        () => NavigationHelper.handleMenuTapWithMenuAppId(
                          context,
                          widget.item.menuAppId,
                        ),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surface.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.arrow_forward, color: Colors.white),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              "Khám phá ngay!",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
