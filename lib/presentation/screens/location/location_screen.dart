import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

const locationRoute = '/location';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationAsync = ref.watch(userLocationProvider);
    final watchLocationAsync$ = ref.watch(watchLocationProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Localização')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //!current location
            const Text('current location'),
            userLocationAsync.when(
                data: (data) => Text("$data"),
                error: (error, stackTrace) => const Text(''),
                loading: () => const CircularProgressIndicator()),
            //!current location
            const Text('Seguimento de la location'),
            watchLocationAsync$.when(
                data: (data) => Text('$data'),
                error: (error, stackTrace) => Text("$error"),
                loading: () => const CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
