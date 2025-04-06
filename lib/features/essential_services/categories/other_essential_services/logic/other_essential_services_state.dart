part of 'other_essential_services_cubit.dart';

@immutable
sealed class OtherEssentialServicesState {}

final class OtherEssentialServicesInitial extends OtherEssentialServicesState {}

class OtherEssentialServicesLoading extends OtherEssentialServicesState {}

class OtherEssentialServicesLoaded extends OtherEssentialServicesState {
  final List<OtherEssentialServiceModel> allOtherEssentialServices;

  OtherEssentialServicesLoaded({required this.allOtherEssentialServices});
}

class OtherEssentialServicesError extends OtherEssentialServicesState {
  final String message;

  OtherEssentialServicesError(this.message);
}
