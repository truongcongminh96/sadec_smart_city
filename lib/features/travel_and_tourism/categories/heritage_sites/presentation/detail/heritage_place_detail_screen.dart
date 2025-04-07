import 'package:flutter/material.dart';
import 'package:sadec_smart_city/shared/widgets/empty_state_widget.dart';

class HeritagePlaceDetailScreen extends StatelessWidget {
  const HeritagePlaceDetailScreen({
    super.key,
    required this.tableId,
    required this.detailId,
  });

  final int tableId;
  final int detailId;

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidget();
  }
}
