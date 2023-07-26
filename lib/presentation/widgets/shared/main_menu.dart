// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _MenuItem {
  final String title;
  final IconData icon;
  final String route;

  _MenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}

final _menuItems = <_MenuItem>[
  _MenuItem(
    title: 'Giroscópio',
    icon: Icons.download,
    route: '/gyroscope',
  ),
  _MenuItem(
    title: 'Acelerômetro',
    icon: Icons.speed,
    route: '/accelerometer',
  ),
  _MenuItem(
    title: 'Magnetómetro',
    icon: Icons.explore_outlined,
    route: '/magnetometer',
  ),
  _MenuItem(
    title: 'Giroscópio Ball',
    icon: Icons.sports_baseball,
    route: '/gyroscope-ball',
  ),
  _MenuItem(
    title: 'Bússola',
    icon: Icons.explore,
    route: '/compass',
  ),
  _MenuItem(
    title: 'Pokemons',
    icon: Icons.explore,
    route: '/pokemons',
  ),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: _menuItems
          .map((menu) => _HomeMenuItem(
                title: menu.title,
                route: menu.route,
                icon: menu.icon,
              ))
          .toList(),
    );
  }
}

class _HomeMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> bgColors;

  const _HomeMenuItem({
    required this.title,
    required this.route,
    required this.icon,
    this.bgColors = const [
      Colors.teal,
      Colors.teal,
    ],
  });

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: bgColors),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
