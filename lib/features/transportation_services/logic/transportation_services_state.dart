part of 'transportation_services_cubit.dart';

@immutable
sealed class TransportationServicesState {}

final class TransportationServicesInitial extends TransportationServicesState {}

class TransportationServicesLoading extends TransportationServicesState {}

class TransportationServicesLoaded extends TransportationServicesState {
  final List<TransportationServiceModel> transportationServices;

  TransportationServicesLoaded({required this.transportationServices});
}

class TransportationServicesError extends TransportationServicesState {
  final String message;

  TransportationServicesError(this.message);
}
