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
    apiKey: 'AIzaSyAiNEQRm3Y5ZzJ4YQuz8ULXooz1BdbTheA',
    appId: '1:269761896849:web:6acf3eaf93c4460091ba30',
    messagingSenderId: '269761896849',
    projectId: 'ecommerce-ce610',
    authDomain: 'ecommerce-ce610.firebaseapp.com',
    storageBucket: 'ecommerce-ce610.appspot.com',
    measurementId: 'G-ZQB2R91FR1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3yJJmRT-8brxitrO5qGxTnwgpmKKPagQ',
    appId: '1:269761896849:android:6ed6f936a5a0a5e791ba30',
    messagingSenderId: '269761896849',
    projectId: 'ecommerce-ce610',
    storageBucket: 'ecommerce-ce610.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDa8QWuA4JyBTjsGOWNabc6tN2kLINEq_I',
    appId: '1:269761896849:ios:9f858d57f1ace0a891ba30',
    messagingSenderId: '269761896849',
    projectId: 'ecommerce-ce610',
    storageBucket: 'ecommerce-ce610.appspot.com',
    iosBundleId: 'com.example.nwsHieuvmEcommerceFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDa8QWuA4JyBTjsGOWNabc6tN2kLINEq_I',
    appId: '1:269761896849:ios:fd8e651b8245587f91ba30',
    messagingSenderId: '269761896849',
    projectId: 'ecommerce-ce610',
    storageBucket: 'ecommerce-ce610.appspot.com',
    iosBundleId: 'com.example.nwsHieuvmEcommerceFlutter.RunnerTests',
  );
}