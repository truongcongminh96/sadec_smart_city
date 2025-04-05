part of 'automatic_teller_machine_cubit.dart';

@immutable
sealed class AutomaticTellerMachineState {}

final class AutomaticTellerMachineInitial extends AutomaticTellerMachineState {}

class AutomaticTellerMachineLoading extends AutomaticTellerMachineState {}

class AutomaticTellerMachineLoaded extends AutomaticTellerMachineState {
  final List<AutomaticTellerMachineModel> atms;
  final List<AutomaticTellerMachineModel> allAtms;

  AutomaticTellerMachineLoaded({required this.atms, required this.allAtms});
}

class AutomaticTellerMachineError extends AutomaticTellerMachineState {
  final String message;

  AutomaticTellerMachineError(this.message);
}
