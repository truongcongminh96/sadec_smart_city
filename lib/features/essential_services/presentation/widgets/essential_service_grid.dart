import 'package:flutter/material.dart';
import 'package:sadec_smart_city/features/essential_services/data/models/essential_service_model.dart';
import 'package:sadec_smart_city/shared/utils/navigation_helper.dart';

class EssentialServiceGrid extends StatelessWidget {
  final List<EssentialServiceModel> services;
  final int crossAxisCount;

  final void Function(EssentialServiceModel item)? onTap;

  const EssentialServiceGrid({
    super.key,
    required this.services,
    required this.crossAxisCount,
    this.onTap,
  });

  static final _gradients = [
    [Color(0xFFff9a9e), Color(0xFFfad0c4)],
    [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
    [Color(0xFF84fab0), Color(0xFF8fd3f4)],
    [Color(0xFFfccb90), Color(0xFFd57eeb)],
    [Color(0xFFc2e9fb), Color(0xFFa1c4fd)],
    [Color(0xFFfddb92), Color(0xFFd1fdff)],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: services.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 100,
      ),
      itemBuilder: (context, index) {
        final item = services[index];
        final colors = _gradients[index % _gradients.length];

        return _AnimatedCard(
          child: InkWell(
            onTap:
                () => NavigationHelper.handleMenuTapWithMenuAppId(
                  context,
                  item.menuAppId,
                ),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(colors: colors),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.network(
                    item.icon,
                    width: 28,
                    height: 28,
                    errorBuilder: (_, __, ___) => const Icon(Icons.image),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item.ten,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AnimatedCard extends StatefulWidget {
  final Widget child;

  const _AnimatedCard({required this.child});

  @override
  State<_AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<_AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scale = Tween(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacity = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: ScaleTransition(scale: _scale, child: widget.child),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
