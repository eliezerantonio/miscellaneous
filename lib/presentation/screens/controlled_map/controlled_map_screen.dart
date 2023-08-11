import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../providers/providers.dart';

const controledMapRoute = '/controlled-map';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInitialLocationAsync = ref.watch(userLocationProvider);
    return Scaffold(
      body: userInitialLocationAsync.when(
        data: (data) => MapViewAndControls(
          initialLat: data.$1,
          initalLng: data.$2,
        ),
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MapViewAndControls extends ConsumerWidget {
  final double initialLat;
  final double initalLng;

  const MapViewAndControls(
      {super.key, required this.initialLat, required this.initalLng});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapControllerState = ref.watch(mapControllerProvider);
    return Stack(
      children: [
        _MapView(lat: initalLng, lng: initalLng),
        //! Back Button
        Positioned(
          top: 30,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        //! get user location

        Positioned(
          bottom: 40,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
              ref.read(mapControllerProvider.notifier).findUser();
            },
            icon: const Icon(Icons.location_searching),
          ),
        ),
        //! seguir user

        Positioned(
          bottom: 90,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
              ref.read(mapControllerProvider.notifier).toggleFollowUser();
            },
            icon: mapControllerState.followUser
                ? const Icon(Icons.directions_run)
                : const Icon(Icons.accessibility_new_outlined),
          ),
        ),

        //! crear marcador

        Positioned(
          bottom: 140,
          left: 20,
          child: IconButton.filledTonal(
            onPressed: () {
              ref
                  .read(mapControllerProvider.notifier)
                  .addMarkerCurrentPosition();
            },
            icon: const Icon(Icons.pin_drop),
          ),
        ),
      ],
    );
  }
}

class _MapView extends ConsumerStatefulWidget {
  const _MapView({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<_MapView> {
  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);
    return GoogleMap(
      markers: mapController.markersSet,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.lat, widget.lng),
        zoom: 18,
      ),
      onLongPress: (latLng) {
        ref.read(mapControllerProvider.notifier).addMarker(
              latLng.latitude,
              latLng.longitude,
              'Custom Marker',
            );
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        ref.read(mapControllerProvider.notifier).setMapController(controller);
      },
    );
  }
}
