import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/data/models/automatic_teller_machine_model.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/data/repositories/automatic_teller_machine_repository.dart';

part 'automatic_teller_machine_state.dart';

class AutomaticTellerMachineCubit extends Cubit<AutomaticTellerMachineState> {
  final AutomaticTellerMachineRepository repository;

  AutomaticTellerMachineCubit(this.repository)
    : super(AutomaticTellerMachineInitial());

  Future<void> loadAtms() async {
    emit(AutomaticTellerMachineLoading());
    try {
      final atms = await repository.fetchAtms(63);
      emit(AutomaticTellerMachineLoaded(atms: atms, allAtms: atms));
    } catch (e) {
      emit(AutomaticTellerMachineError(e.toString()));
    }
  }

  void searchAtms(String query) {
    if (state is AutomaticTellerMachineLoaded) {
      final allAtms = (state as AutomaticTellerMachineLoaded).allAtms;
      final filteredAtms =
          allAtms.where((atm) {
            final lowerQuery = query.toLowerCase();
            return atm.ten.toLowerCase().contains(lowerQuery) ||
                (atm.diaChi != null &&
                    atm.diaChi!.toLowerCase().contains(lowerQuery));
          }).toList();

      emit(AutomaticTellerMachineLoaded(atms: filteredAtms, allAtms: allAtms));
    }
  }
}
