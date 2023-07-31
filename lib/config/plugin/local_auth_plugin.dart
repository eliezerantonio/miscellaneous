import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../../utils/utils.dart';

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static avaliableBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      //some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {}
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate({bool biometricOnly = false}) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Por favor, autentique para continuar',
        options: AuthenticationOptions(biometricOnly: biometricOnly),
      );

      return (
        didAuthenticate,
        didAuthenticate ? 'Desbloqueado' : 'Cancelado pelo usuário'
      );
    } on PlatformException catch (e) {
      log(e.toString());
      localAuthErrors(e.code);

      return (false, e.toString());
    }
  }
}
