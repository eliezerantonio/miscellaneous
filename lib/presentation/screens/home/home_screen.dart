import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:miscellaneous/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diversos'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/settings');
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            MainMenu(),
          ],
        ),
      ),
    );
  }
}
