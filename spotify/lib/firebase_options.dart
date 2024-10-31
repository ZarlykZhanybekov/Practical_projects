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
    apiKey: 'AIzaSyD0EXjPypntWseL3x58KJEYySgoxincAA8',
    appId: '1:652275167644:web:d5938a0dc1987930905859',
    messagingSenderId: '652275167644',
    projectId: 'spotify-4b02b',
    authDomain: 'spotify-4b02b.firebaseapp.com',
    storageBucket: 'spotify-4b02b.appspot.com',
    measurementId: 'G-ZFB5KNHL78',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVYjctVx3hsxnkkHnXgy3LA_uJfJat8BM',
    appId: '1:652275167644:android:e36d6c4659151b12905859',
    messagingSenderId: '652275167644',
    projectId: 'spotify-4b02b',
    storageBucket: 'spotify-4b02b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAanx1pp3qKpbLo9YUg5K-NL0s0guf27Mo',
    appId: '1:652275167644:ios:527f1d27a73a9608905859',
    messagingSenderId: '652275167644',
    projectId: 'spotify-4b02b',
    storageBucket: 'spotify-4b02b.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAanx1pp3qKpbLo9YUg5K-NL0s0guf27Mo',
    appId: '1:652275167644:ios:527f1d27a73a9608905859',
    messagingSenderId: '652275167644',
    projectId: 'spotify-4b02b',
    storageBucket: 'spotify-4b02b.appspot.com',
    iosBundleId: 'com.example.spotify',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD0EXjPypntWseL3x58KJEYySgoxincAA8',
    appId: '1:652275167644:web:e3c547f7ccf2b2d1905859',
    messagingSenderId: '652275167644',
    projectId: 'spotify-4b02b',
    authDomain: 'spotify-4b02b.firebaseapp.com',
    storageBucket: 'spotify-4b02b.appspot.com',
    measurementId: 'G-FVLXWJ54LY',
  );

}