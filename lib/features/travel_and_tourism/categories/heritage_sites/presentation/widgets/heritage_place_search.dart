import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/travel_and_tourism/categories/heritage_sites/logic/heritage_place_cubit.dart';
import 'dart:async';

class HeritagePlaceSearch extends StatefulWidget {
  const HeritagePlaceSearch({super.key});

  @override
  State<HeritagePlaceSearch> createState() => _HeritagePlaceSearchState();
}

class _HeritagePlaceSearchState extends State<HeritagePlaceSearch> {
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
            color: Colors.grey[100],
            border: Border.all(
              color: _isFocused ? Colors.green : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  decoration: const InputDecoration(
                    hintText: "Tìm kiếm di tích, địa điểm...",
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {});
                    if (_debounce?.isActive ?? false) _debounce!.cancel();
                    _debounce = Timer(const Duration(milliseconds: 300), () {
                      context.read<HeritagePlaceCubit>().searchHeritagePlaces(
                        value,
                      );
                    });
                  },
                ),
              ),
              if (_controller.text.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _controller.clear();
                    setState(() {});
                    context.read<HeritagePlaceCubit>().searchHeritagePlaces('');
                  },
                  child: const Icon(Icons.clear, color: Colors.grey),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
