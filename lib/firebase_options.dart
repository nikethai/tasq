// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQBeI40g5G3FgjH26i2e0uZwWE78-Qwug',
    appId: '1:926312104243:android:f0ba01f977fb9517dabe46',
    messagingSenderId: '926312104243',
    projectId: 'tasq-dfe1e',
    storageBucket: 'tasq-dfe1e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEzhl5wlETQBYm1eI8jZWga0UG4W3TPaQ',
    appId: '1:926312104243:ios:b818d58a28560a11dabe46',
    messagingSenderId: '926312104243',
    projectId: 'tasq-dfe1e',
    storageBucket: 'tasq-dfe1e.appspot.com',
    iosClientId: '926312104243-k9h50n4jgva0uiddkgfp5qe0m5npsfsl.apps.googleusercontent.com',
    iosBundleId: 'com.company.tasq',
  );
}
