import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart' show gyroscopeProvider;

class GyroscopScreen extends ConsumerWidget {
  const GyroscopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Giroscopio')),
      body: Center(
        child: gyroscope$.when(
          data: (value) => Text(value.toString()),
          error: (error, strackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
