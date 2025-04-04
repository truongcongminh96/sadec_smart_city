import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/essential_services/data/models/essential_service_model.dart';
import 'package:sadec_smart_city/features/essential_services/logic/essential_services_cubit.dart';

class OtherServiceGrid extends StatelessWidget {
  final EssentialServiceModel item;

  const OtherServiceGrid({super.key, required this.item});

  int _getCrossAxisCount(double width) {
    if (width >= 1200) return 6;
    if (width >= 800) return 4;
    if (width >= 600) return 3;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EssentialServicesCubit>();
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Image.network(
                item.icon,
                width: 30,
                height: 30,
                errorBuilder:
                    (_, __, ___) => const Icon(Icons.image_not_supported),
              ),
            ),
            const SizedBox(width: 20),
            Text(
              item.ten,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        BlocBuilder<EssentialServicesCubit, EssentialServicesState>(
          builder: (context, _) {
            final sub = cubit.subServicesMap[item.menuAppId];
            if (sub == null) {
              cubit.fetchSubServices(item.menuAppId);
              return const Center(child: CircularProgressIndicator());
            }

            final crossAxisCount = _getCrossAxisCount(width);

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(6),
              child: GridView.builder(
                itemCount: sub.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 80,
                ),
                itemBuilder: (context, index) {
                  final service = sub[index];
                  return _AnimatedServiceItem(service: service);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _AnimatedServiceItem extends StatefulWidget {
  final EssentialServiceModel service;

  const _AnimatedServiceItem({required this.service});

  @override
  State<_AnimatedServiceItem> createState() => _AnimatedServiceItemState();
}

class _AnimatedServiceItemState extends State<_AnimatedServiceItem> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: () {
        // TODO: Handle tap
      },
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:
                  isDark
                      ? [const Color(0xFF8439FF), const Color(0xFFEE58C5)]
                      : [const Color(0xFFFFDEE9), const Color(0xFFFEC8D8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  widget.service.icon,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (_, __, ___) => const Icon(Icons.image, size: 24),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  widget.service.ten,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
