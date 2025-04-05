part of 'public_wifi_spot_cubit.dart';

@immutable
sealed class PublicWifiSpotState {}

final class PublicWifiSpotInitial extends PublicWifiSpotState {}

class PublicWifiSpotLoading extends PublicWifiSpotState {}

class PublicWifiSpotLoaded extends PublicWifiSpotState {
  final List<PublicWifiSpotModel> publicWifiSpots;
  final List<PublicWifiSpotModel> allPublicWifiSpots;

  PublicWifiSpotLoaded({
    required this.publicWifiSpots,
    required this.allPublicWifiSpots,
  });
}

class PublicWifiSpotError extends PublicWifiSpotState {
  final String message;

  PublicWifiSpotError(this.message);
}
