// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCMrMUtOrwkB40JSB8wGgA10EK02uhLiPI',
    appId: '1:741524518122:web:b291123f204ac02f7f9393',
    messagingSenderId: '741524518122',
    projectId: 'fier-2bae8',
    authDomain: 'fier-2bae8.firebaseapp.com',
    storageBucket: 'fier-2bae8.appspot.com',
    measurementId: 'G-GLRLHLKFSW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYw_fISgzmXGtebkIMmjd3rbnAK6sAk-A',
    appId: '1:741524518122:android:e7fcec23d019b4e67f9393',
    messagingSenderId: '741524518122',
    projectId: 'fier-2bae8',
    storageBucket: 'fier-2bae8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5AdftTlOAA1Gj8HAjbmHXvkxg3G0yAFU',
    appId: '1:741524518122:ios:13ccf4cdfe8e9ca27f9393',
    messagingSenderId: '741524518122',
    projectId: 'fier-2bae8',
    storageBucket: 'fier-2bae8.appspot.com',
    iosBundleId: 'com.example.fier',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5AdftTlOAA1Gj8HAjbmHXvkxg3G0yAFU',
    appId: '1:741524518122:ios:ef2111192441d6b87f9393',
    messagingSenderId: '741524518122',
    projectId: 'fier-2bae8',
    storageBucket: 'fier-2bae8.appspot.com',
    iosBundleId: 'com.example.fier.RunnerTests',
  );
}
