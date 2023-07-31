import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCheckBiometrics = ref.watch(canCheckBiometricsProvider);

    final localAuthState = ref.watch(localAuthProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () async {
                await ref.read(localAuthProvider.notifier).authenticateUser();
              },
              child: const Text('Autenticar'),
            ),
            canCheckBiometrics.when(
              data: (canCheck) => Text("Pode: $canCheck"),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator(),
            ),
            const Text('Estado Biometrico', style: TextStyle(fontSize: 30)),
            Text('Estado: ${localAuthState.toString()}',
                style: const TextStyle(fontSize: 17)),
          ],
        ),
      ),
    );
  }
}
