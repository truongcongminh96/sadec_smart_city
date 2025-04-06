import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/data/models/bank_model.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/data/repositories/bank_repository.dart';

part 'bank_state.dart';

class BankCubit extends Cubit<BankState> {
  final BankRepository repository;

  BankCubit(this.repository) : super(BankInitial());

  Future<void> loadBanks(int menuAppId) async {
    emit(BankLoading());
    try {
      final banks = await repository.fetchBanks(menuAppId);
      emit(BankLoaded(banks: banks, allBanks: banks));
    } catch (e) {
      emit(BankError(e.toString()));
    }
  }

  void searchBanks(String query) {
    if (state is BankLoaded) {
      final allBanks = (state as BankLoaded).allBanks;
      final filteredBanks =
          allBanks.where((bank) {
            final lowerQuery = query.toLowerCase();
            return bank.ten.toLowerCase().contains(lowerQuery) ||
                (bank.diaChi != null &&
                    bank.diaChi!.toLowerCase().contains(lowerQuery)) ||
                (bank.sdt != null && bank.sdt!.contains(lowerQuery));
          }).toList();

      emit(BankLoaded(banks: filteredBanks, allBanks: allBanks));
    }
  }
}
