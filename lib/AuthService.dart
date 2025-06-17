import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class AuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> authenticateLocally() async {
    bool isAuthenticate = false;

    bool isDeviceSupported = await _localAuth.isDeviceSupported();
    bool canCheckBiometrics = await _localAuth.canCheckBiometrics;

    if (!canCheckBiometrics || !isDeviceSupported) {
      print("Biometric authentication not available.");
      return false;
    }

    try {
      isAuthenticate = await _localAuth.authenticate(
          localizedReason: "We need to authenticate for user this app ",
          options: AuthenticationOptions(
              stickyAuth: true, useErrorDialogs: true, biometricOnly: false));

      print("Auth Print :${isAuthenticate.toString()}");
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        // Add handling of no hardware here.
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        // ...
      } else {
        // ...
      }
    } catch (e) {
      isAuthenticate = false;
      print("Error :$e");
    }

    return isAuthenticate;
  }
}
