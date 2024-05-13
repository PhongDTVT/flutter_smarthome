// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBT2LxGqZCKPVGxUGtSItGL5ZwoZQq9hPM',
    appId: '1:451307007900:web:277dd5dfdca64200d7e259',
    messagingSenderId: '451307007900',
    projectId: 'rpi-image-4d5f5',
    authDomain: 'rpi-image-4d5f5.firebaseapp.com',
    databaseURL: 'https://rpi-image-4d5f5-default-rtdb.firebaseio.com',
    storageBucket: 'rpi-image-4d5f5.appspot.com',
    measurementId: 'G-SLKJ9JW5SY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQ3GDrBNGvjbfn2PiShjFBSlAofKmViPQ',
    appId: '1:451307007900:android:499931ba30832617d7e259',
    messagingSenderId: '451307007900',
    projectId: 'rpi-image-4d5f5',
    databaseURL: 'https://rpi-image-4d5f5-default-rtdb.firebaseio.com',
    storageBucket: 'rpi-image-4d5f5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAOte0jHzz_exsfHDrvBitadGsgV1KEHDk',
    appId: '1:451307007900:ios:bd7648c1dcbd5926d7e259',
    messagingSenderId: '451307007900',
    projectId: 'rpi-image-4d5f5',
    databaseURL: 'https://rpi-image-4d5f5-default-rtdb.firebaseio.com',
    storageBucket: 'rpi-image-4d5f5.appspot.com',
    iosBundleId: 'com.example.homeIot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAOte0jHzz_exsfHDrvBitadGsgV1KEHDk',
    appId: '1:451307007900:ios:bd7648c1dcbd5926d7e259',
    messagingSenderId: '451307007900',
    projectId: 'rpi-image-4d5f5',
    databaseURL: 'https://rpi-image-4d5f5-default-rtdb.firebaseio.com',
    storageBucket: 'rpi-image-4d5f5.appspot.com',
    iosBundleId: 'com.example.homeIot',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBT2LxGqZCKPVGxUGtSItGL5ZwoZQq9hPM',
    appId: '1:451307007900:web:cc4b44c9e2c5ea80d7e259',
    messagingSenderId: '451307007900',
    projectId: 'rpi-image-4d5f5',
    authDomain: 'rpi-image-4d5f5.firebaseapp.com',
    databaseURL: 'https://rpi-image-4d5f5-default-rtdb.firebaseio.com',
    storageBucket: 'rpi-image-4d5f5.appspot.com',
    measurementId: 'G-TBTRSKDFW3',
  );

}