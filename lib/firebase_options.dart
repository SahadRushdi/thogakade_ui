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
    apiKey: 'AIzaSyCNnxmNkXOPQtoR_CMw-HHdxOqRDfNJYLI',
    appId: '1:1077555050079:web:e9d03e6a54f4a367f80dea',
    messagingSenderId: '1077555050079',
    projectId: 'thogakade-ui',
    authDomain: 'thogakade-ui.firebaseapp.com',
    databaseURL: 'https://thogakade-ui-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'thogakade-ui.firebasestorage.app',
    measurementId: 'G-LP670PWHNP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCww-K2MQfZgtdad2ip6ZxjUZtdlXk1F4E',
    appId: '1:1077555050079:android:0a0543ae46a20077f80dea',
    messagingSenderId: '1077555050079',
    projectId: 'thogakade-ui',
    databaseURL: 'https://thogakade-ui-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'thogakade-ui.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZ6zDr1kD2-Sc0OOD66hkUBaSH8dfK6YM',
    appId: '1:1077555050079:ios:b3a778b8aecd3d6ef80dea',
    messagingSenderId: '1077555050079',
    projectId: 'thogakade-ui',
    databaseURL: 'https://thogakade-ui-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'thogakade-ui.firebasestorage.app',
    iosBundleId: 'com.example.thogakadeUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZ6zDr1kD2-Sc0OOD66hkUBaSH8dfK6YM',
    appId: '1:1077555050079:ios:b3a778b8aecd3d6ef80dea',
    messagingSenderId: '1077555050079',
    projectId: 'thogakade-ui',
    databaseURL: 'https://thogakade-ui-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'thogakade-ui.firebasestorage.app',
    iosBundleId: 'com.example.thogakadeUi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCNnxmNkXOPQtoR_CMw-HHdxOqRDfNJYLI',
    appId: '1:1077555050079:web:f086454c9564d640f80dea',
    messagingSenderId: '1077555050079',
    projectId: 'thogakade-ui',
    authDomain: 'thogakade-ui.firebaseapp.com',
    databaseURL: 'https://thogakade-ui-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'thogakade-ui.firebasestorage.app',
    measurementId: 'G-4GKLDXZ1NX',
  );
}