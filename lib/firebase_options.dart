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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDSNow1b4ZYUzllEz0w21w3xVZRg6IqTmY',
    appId: '1:871702660880:web:84903bc53df908bbbc8795',
    messagingSenderId: '871702660880',
    projectId: 'fir-series-dbdee',
    authDomain: 'fir-series-dbdee.firebaseapp.com',
    storageBucket: 'fir-series-dbdee.appspot.com',
    measurementId: 'G-JH6DHX16QV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVzjK1nFoKjObk2OFYt0r2bHp8Gu-SOXk',
    appId: '1:871702660880:android:828565224ef052c3bc8795',
    messagingSenderId: '871702660880',
    projectId: 'fir-series-dbdee',
    storageBucket: 'fir-series-dbdee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAr6vwPIIIYg_eeL7MMemUT7A1TQneChY8',
    appId: '1:871702660880:ios:66864f3082b8eb7bbc8795',
    messagingSenderId: '871702660880',
    projectId: 'fir-series-dbdee',
    storageBucket: 'fir-series-dbdee.appspot.com',
    iosBundleId: 'com.example.firebaseSeries',
  );
}
