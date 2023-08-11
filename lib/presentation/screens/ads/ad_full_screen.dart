import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscellaneous/presentation/providers/providers.dart';

class AdFullScreen extends ConsumerWidget {
  const AdFullScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interstitialAdAsync = ref.watch(addInterstitialProvider);

    ref.listen(addInterstitialProvider, (previous, next) {
      if (!next.hasValue) return;
      if (next.value == null) return;

      next.value!.show();
    });
    if (interstitialAdAsync.isLoading) {
      return const Scaffold(
        body: Center(child: Text('Carregando Ad')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Full Screen'),
      ),
      body: const Center(
        child: Text('Ja pode voltar a ver essa tel'),
      ),
    );
  }
}
