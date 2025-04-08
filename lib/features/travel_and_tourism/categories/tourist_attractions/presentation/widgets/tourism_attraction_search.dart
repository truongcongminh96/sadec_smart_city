import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:sadec_smart_city/features/travel_and_tourism/categories/tourist_attractions/logic/tourism_attraction_cubit.dart';

class TourismAttractionSearch extends StatefulWidget {
  const TourismAttractionSearch({super.key});

  @override
  State<TourismAttractionSearch> createState() =>
      _TourismAttractionSearchState();
}

class _TourismAttractionSearchState extends State<TourismAttractionSearch> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isFocused = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () => FocusScope.of(context).requestFocus(_focusNode),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isDark ? Colors.grey[800] : Colors.grey[100],
            border: Border.all(
              color: _isFocused ? Colors.green : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: isDark ? Colors.white54 : Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  style: TextStyle(color: theme.textTheme.bodyMedium?.color),
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm di tích, địa điểm...",
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 300), () {
                      context
                          .read<TourismAttractionCubit>()
                          .searchTourismAttractions(value);
                    });
                  },
                ),
              ),
              if (_controller.text.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _controller.clear();
                    setState(() {});
                    context
                        .read<TourismAttractionCubit>()
                        .searchTourismAttractions('');
                  },
                  child: Icon(
                    Icons.clear,
                    color: isDark ? Colors.white54 : Colors.grey,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
