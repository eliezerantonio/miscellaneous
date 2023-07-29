import 'package:flutter/material.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton(
              onPressed: () {},
              child: const Text('Autenticar'),
            ),
            const Text(
              'Estado Biometrico',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'Estado XXX',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
