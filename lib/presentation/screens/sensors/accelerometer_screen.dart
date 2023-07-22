import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accelerometerProvider$ = ref.watch(accelerometerUserProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Acelorómetro')),
      body: Center(
        child: accelerometerProvider$.when(
          data: (data) => Text(data.toString()),
          error: (_, __) => const Text('Um erro aconteceu'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
