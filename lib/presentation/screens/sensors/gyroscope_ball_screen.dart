import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class GyroscopBallScreen extends ConsumerWidget {
  const GyroscopBallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Giroscopio animado')),
      body: Center(
        child: gyroscope$.when(
          data: (value) => SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: MovinBall(x: value.x, y: value.y),
          ),
          error: (error, strackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MovinBall extends StatelessWidget {
  final double x;
  final double y;

  const MovinBall({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHight = size.height;

    double currentYPos = (y * 1000);
    double currentXPos = (x * 1000);

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          left: (currentYPos - 50) + (screenWidth / 2),
          top: (currentXPos - 50) + (screenHight / 2),
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 1000),
          child: const Ball(),
        ),
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
