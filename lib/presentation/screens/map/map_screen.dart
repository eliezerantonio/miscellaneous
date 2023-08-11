import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../providers/providers.dart';

const mapsRoute = '/maps';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPositionAsync = ref.watch(userLocationProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: currentPositionAsync.when(
        data: (data) => MapView(
          initialLat: data.$1,
          initalLng: data.$2,
        ),
        error: (error, stackTrace) => Text('Error: $error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class MapView extends StatefulWidget {
  final double initialLat;
  final double initalLng;

  const MapView({super.key, required this.initialLat, required this.initalLng});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLat, widget.initalLng),
        zoom: 18,
      ),
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        // _controller.complete(controller);
      },
    );
  }
}
