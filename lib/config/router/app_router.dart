import 'package:go_router/go_router.dart';
import 'package:miscellaneous/presentation/screens/permissions/permissions_screen.dart';

import '../../presentation/screens/screens.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const PermissionsScreen(),
    ),
    GoRoute(
      path: '/gyroscope',
      builder: (context, state) => const GyroscopScreen(),
    ),
    GoRoute(
      path: '/accelerometer',
      builder: (context, state) => const AccelerometerScreen(),
    ),
    GoRoute(
      path: '/magnetometer',
      builder: (context, state) => const MagnetometerScreen(),
    ),
    GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopBallScreen(),
    ),
    GoRoute(
      path: '/compass',
      builder: (context, state) => const CompassScreen(),
    ),
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final pokemonId = state.pathParameters['id'] ?? '1';
            return PokemonScreen(pokemonId: pokemonId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/biometrics',
      builder: (context, state) => const BiometricScreen(),
    ),
  ],
);
