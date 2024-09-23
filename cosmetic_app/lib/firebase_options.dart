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
    apiKey: 'AIzaSyAD3C2Quh2SO0JkM65m8eLMzEDRnT4cbX4',
    appId: '1:991655813427:web:57ac490c5470c13ac55e46',
    messagingSenderId: '991655813427',
    projectId: 'belezzaapp-fe2cc',
    authDomain: 'belezzaapp-fe2cc.firebaseapp.com',
    storageBucket: 'belezzaapp-fe2cc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6q7UbysyBbCbzxd1IYRlDZidJl_cBxuM',
    appId: '1:991655813427:android:e5596b46f4095815c55e46',
    messagingSenderId: '991655813427',
    projectId: 'belezzaapp-fe2cc',
    storageBucket: 'belezzaapp-fe2cc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkphbaAn2wEoNrJp53k6irQcR_I7NSrNU',
    appId: '1:991655813427:ios:5beb15ff66ea5225c55e46',
    messagingSenderId: '991655813427',
    projectId: 'belezzaapp-fe2cc',
    storageBucket: 'belezzaapp-fe2cc.appspot.com',
    iosBundleId: 'com.example.belezza',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkphbaAn2wEoNrJp53k6irQcR_I7NSrNU',
    appId: '1:991655813427:ios:5beb15ff66ea5225c55e46',
    messagingSenderId: '991655813427',
    projectId: 'belezzaapp-fe2cc',
    storageBucket: 'belezzaapp-fe2cc.appspot.com',
    iosBundleId: 'com.example.belezza',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAD3C2Quh2SO0JkM65m8eLMzEDRnT4cbX4',
    appId: '1:991655813427:web:ed0a7cc5019dba4bc55e46',
    messagingSenderId: '991655813427',
    projectId: 'belezzaapp-fe2cc',
    authDomain: 'belezzaapp-fe2cc.firebaseapp.com',
    storageBucket: 'belezzaapp-fe2cc.appspot.com',
  );
}
