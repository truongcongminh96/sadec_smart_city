part of 'bank_cubit.dart';

@immutable
sealed class BankState {}

final class BankInitial extends BankState {}

class BankLoading extends BankState {}

class BankLoaded extends BankState {
  final List<BankModel> banks;
  final List<BankModel> allBanks;

  BankLoaded({required this.banks, required this.allBanks});
}

class BankError extends BankState {
  final String message;

  BankError(this.message);
}
