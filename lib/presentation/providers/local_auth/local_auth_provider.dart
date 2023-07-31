// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:miscellaneous/config/plugin/local_auth_plugin.dart';

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});

enum LocalAuthStatus { authenticated, notuthenticated, authenticating }

class LocalAuthState {
  final bool didAuthenticate;
  final LocalAuthStatus status;
  final String message;

  LocalAuthState({
    this.didAuthenticate = false,
    this.status = LocalAuthStatus.notuthenticated,
    this.message = '',
  });

  LocalAuthState copyWith({
    bool? didAuthenticate,
    LocalAuthStatus? status,
    String? message,
  }) =>
      LocalAuthState(
        didAuthenticate: didAuthenticate ?? this.didAuthenticate,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  String toString() => '''
   
    didAuthenticate: $didAuthenticate,
    status: $status,
    message: $message ''';
}

class LocalAuthNotifier extends StateNotifier<LocalAuthState> {
  LocalAuthNotifier() : super(LocalAuthState());

  Future<(bool, String)> authenticateUser() async {
    final (didAuthenticate, message) = await LocalAuthPlugin.authenticate();

    state = state.copyWith(
      didAuthenticate: didAuthenticate,
      message: message,
      status: didAuthenticate
          ? LocalAuthStatus.authenticated
          : LocalAuthStatus.notuthenticated,
    );

    return (didAuthenticate, message);
  }
}

final localAuthProvider =
    StateNotifierProvider.autoDispose<LocalAuthNotifier, LocalAuthState>((ref) {
  return LocalAuthNotifier();
});
