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
    apiKey: 'AIzaSyCUdMSQE_2ALg0IA-cYlK2P2t_zbcLp4fA',
    appId: '1:954529334536:web:2e43333bde07162d5b58bd',
    messagingSenderId: '954529334536',
    projectId: 'flutterpro-84109',
    authDomain: 'flutterpro-84109.firebaseapp.com',
    storageBucket: 'flutterpro-84109.appspot.com',
    measurementId: 'G-84RMDSJ8FV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQpiP_HIsJ7sWCJrobDR9JojlwnF6OnqQ',
    appId: '1:954529334536:android:e2e1880eb4e349ec5b58bd',
    messagingSenderId: '954529334536',
    projectId: 'flutterpro-84109',
    storageBucket: 'flutterpro-84109.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfzgua_JoEKWF2TkLY4wgsN6OLRr9q0q8',
    appId: '1:954529334536:ios:14d945355e4745415b58bd',
    messagingSenderId: '954529334536',
    projectId: 'flutterpro-84109',
    storageBucket: 'flutterpro-84109.appspot.com',
    iosBundleId: 'com.example.flutterSeupPro',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfzgua_JoEKWF2TkLY4wgsN6OLRr9q0q8',
    appId: '1:954529334536:ios:33e9b19a03b6f5925b58bd',
    messagingSenderId: '954529334536',
    projectId: 'flutterpro-84109',
    storageBucket: 'flutterpro-84109.appspot.com',
    iosBundleId: 'com.example.flutterSeupPro.RunnerTests',
  );
}
