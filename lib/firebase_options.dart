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
    apiKey: 'AIzaSyC2w2P6bJX8PQKa_ulwEnyrQZnhrWkNL7o',
    appId: '1:282534085438:web:45e86f4beecfce7251226f',
    messagingSenderId: '282534085438',
    projectId: 'ecommerce-app-a143a',
    authDomain: 'ecommerce-app-a143a.firebaseapp.com',
    storageBucket: 'ecommerce-app-a143a.appspot.com',
    measurementId: 'G-M96S3CCFHT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVkNC9EmQr8DYpLTeVcgCMEUK2ZCe5vJE',
    appId: '1:282534085438:android:6fd5fafcb398cdc951226f',
    messagingSenderId: '282534085438',
    projectId: 'ecommerce-app-a143a',
    storageBucket: 'ecommerce-app-a143a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1cg4lGgkDTgWyz9zClCCMcHoKIXQd9sE',
    appId: '1:282534085438:ios:6cf8c743309e24a551226f',
    messagingSenderId: '282534085438',
    projectId: 'ecommerce-app-a143a',
    storageBucket: 'ecommerce-app-a143a.appspot.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1cg4lGgkDTgWyz9zClCCMcHoKIXQd9sE',
    appId: '1:282534085438:ios:85a162e06b5227cd51226f',
    messagingSenderId: '282534085438',
    projectId: 'ecommerce-app-a143a',
    storageBucket: 'ecommerce-app-a143a.appspot.com',
    iosBundleId: 'com.example.eCommerce.RunnerTests',
  );
}