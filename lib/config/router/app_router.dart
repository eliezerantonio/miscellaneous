import 'package:go_router/go_router.dart';

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
      path: '/db-pokemons',
      builder: (context, state) => const DbPokemonScreen(),
    ),
    GoRoute(
      path: '/biometrics',
      builder: (context, state) => const BiometricScreen(),
    ),
    GoRoute(
      path: locationRoute,
      builder: (context, state) => const LocationScreen(),
    ),
    GoRoute(
      path: mapsRoute,
      builder: (context, state) => const MapScreen(),
    ),
    GoRoute(
      path: controledMapRoute,
      builder: (context, state) => const ControlledMapScreen(),
    ),
    GoRoute(
      path: bagRoute,
      builder: (context, state) => const BadgeScreen(),
    ),
    GoRoute(
      path: '/ad-fullscreen',
      builder: (context, state) => const AdFullScreen(),
    ),
    GoRoute(
      path: '/ad-rewarded',
      builder: (context, state) => const AdRewardedScreen(),
    ),
  ],
);
