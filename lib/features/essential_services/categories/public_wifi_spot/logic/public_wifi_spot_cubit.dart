import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/data/models/public_wifi_spot_model.dart';
import 'package:sadec_smart_city/features/essential_services/categories/public_wifi_spot/data/repositories/public_wifi_spot_repository.dart';

part 'public_wifi_spot_state.dart';

class PublicWifiSpotCubit extends Cubit<PublicWifiSpotState> {
  final PublicWifiSpotRepository repository;

  PublicWifiSpotCubit(this.repository) : super(PublicWifiSpotInitial());

  Future<void> loadPublicWifiSpots(int menuAppId) async {
    emit(PublicWifiSpotLoading());
    try {
      final publicWifiSpots = await repository.fetchPublicWifiSpots(menuAppId);
      emit(
        PublicWifiSpotLoaded(
          publicWifiSpots: publicWifiSpots,
          allPublicWifiSpots: publicWifiSpots,
        ),
      );
    } catch (e) {
      emit(PublicWifiSpotError(e.toString()));
    }
  }

  void searchPublicWifiSpots(String query) {
    if (state is PublicWifiSpotLoaded) {
      final allPublicWifiSpots =
          (state as PublicWifiSpotLoaded).allPublicWifiSpots;
      final filteredPublicWifiSpots =
          allPublicWifiSpots.where((publicWifiSpot) {
            final lowerQuery = query.toLowerCase();
            return publicWifiSpot.ten.toLowerCase().contains(lowerQuery) ||
                (publicWifiSpot.diaChi != null &&
                    publicWifiSpot.diaChi!.toLowerCase().contains(lowerQuery));
          }).toList();

      emit(
        PublicWifiSpotLoaded(
          publicWifiSpots: filteredPublicWifiSpots,
          allPublicWifiSpots: allPublicWifiSpots,
        ),
      );
    }
  }
}
