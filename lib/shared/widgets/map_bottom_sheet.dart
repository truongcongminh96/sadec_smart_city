// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapBottomSheet extends StatelessWidget {
//   final String title;
//   final double lat;
//   final double lng;
//
//   const MapBottomSheet({
//     super.key,
//     required this.title,
//     required this.lat,
//     required this.lng,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final CameraPosition initialPosition = CameraPosition(
//       target: LatLng(lat, lng),
//       zoom: 16,
//     );
//
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.5,
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: Theme.of(
//               context,
//             ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 12),
//           Expanded(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: GoogleMap(
//                 initialCameraPosition: initialPosition,
//                 markers: {
//                   Marker(
//                     markerId: const MarkerId('location'),
//                     position: LatLng(lat, lng),
//                     infoWindow: InfoWindow(title: title),
//                   ),
//                 },
//                 zoomControlsEnabled: false,
//                 myLocationButtonEnabled: false,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
