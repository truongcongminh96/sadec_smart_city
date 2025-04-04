import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/data/models/bank_model.dart';
import 'package:sadec_smart_city/features/essential_services/categories/bank/data/repositories/bank_repository.dart';

part 'bank_state.dart';

class BankCubit extends Cubit<BankState> {
  final BankRepository repository;

  BankCubit(this.repository) : super(BankInitial());

  Future<void> loadBanks() async {
    emit(BankLoading());
    try {
      final banks = await repository.fetchBanks(102);
      emit(BankLoaded(banks));
    } catch (e) {
      emit(BankError(e.toString()));
    }
  }
}
