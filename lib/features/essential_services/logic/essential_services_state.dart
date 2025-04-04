part of 'essential_services_cubit.dart';

sealed class EssentialServicesState {}

final class EssentialServicesInitial extends EssentialServicesState {}

final class EssentialServicesLoading extends EssentialServicesState {}

final class EssentialServicesLoaded extends EssentialServicesState {}

final class EssentialServicesError extends EssentialServicesState {
  final String message;

  EssentialServicesError(this.message);
}

class EssentialServicesSubLoaded extends EssentialServicesState {
  final List<EssentialServiceModel> subServices;

  EssentialServicesSubLoaded({required this.subServices});
}
