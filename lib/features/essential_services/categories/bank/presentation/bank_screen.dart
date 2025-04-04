import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/data/repositories/bank_repository.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/logic/bank_cubit.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/presentation/widgets/bank_card.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/presentation/widgets/bank_search_bar.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BankCubit(getIt<BankRepository>())..loadBanks(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Danh sách Ngân hàng'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Builder(
              builder:
                  (context) => BankSearchBar(controller: _searchController),
            ),
          ),
        ),
        body: BlocBuilder<BankCubit, BankState>(
          builder: (context, state) {
            if (state is BankLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BankLoaded) {
              final banks = state.banks;
              if (banks.isEmpty) {
                return const Center(
                  child: Text("Không tìm thấy ngân hàng nào."),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: banks.length,
                itemBuilder: (context, index) {
                  return BankCard(bank: banks[index]);
                },
              );
            }
            if (state is BankError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
