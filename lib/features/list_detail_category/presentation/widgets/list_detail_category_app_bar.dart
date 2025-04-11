import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/list_detail_category/logic/list_detail_category_cubit.dart';

class ListDetailCategoryAppBar extends StatelessWidget {
  final TextEditingController controller;

  const ListDetailCategoryAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Tìm kiếm (tên, địa chỉ, sđt)...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.pinkAccent,
              fontStyle: FontStyle.italic,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged:
              (text) => context
                  .read<ListDetailCategoryCubit>()
                  .searchListDetailCategory(text),
        ),
      ),
    );
  }
}
