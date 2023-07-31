import 'package:local_auth/error_codes.dart' as auth_errors;

(bool, String) localAuthErrors(String code) {
  switch (code) {
    case auth_errors.notEnrolled:
      return _message('Sem permissão para Bimétricos.');

    case auth_errors.lockedOut:
      return _message('Excedeu número de tentativas.');

    case auth_errors.notAvailable:
      return _message('Sem Biométricos disponível.');

    case auth_errors.passcodeNotSet:
      return _message('Nenhum PIN configurado.');

    case auth_errors.permanentlyLockedOut:
      return _message('Requer desbloquear o telefone.');

    default:
      return _message('Erro desconhecido.');
  }
}

(bool, String) _message(String message) {
  return (false, message);
}
//* eliezer antonio
