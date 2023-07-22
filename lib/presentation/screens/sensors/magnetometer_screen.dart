import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final magnetometerProvider$ = ref.watch(magnetometerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('magnetómetro')),
      body: Center(
        child: magnetometerProvider$.when(
          data: (data) => Text(data.toString()),
          error: (_, __) => const Text('Um erro aconteceu'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
