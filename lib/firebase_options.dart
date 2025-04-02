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
    apiKey: 'AIzaSyBY5FFkT35A6wfp8MnRk5CdArCz-yNR8wI',
    appId: '1:886504217577:web:fead0fa28dca9c6e178978',
    messagingSenderId: '886504217577',
    projectId: 'inventory-management-b610f',
    authDomain: 'inventory-management-b610f.firebaseapp.com',
    storageBucket: 'inventory-management-b610f.firebasestorage.app',
    measurementId: 'G-4QZBDV8FQB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBpy6J-S5Quahd4zVxbL5K3bochd4XEnxw',
    appId: '1:886504217577:android:95d1807219afa316178978',
    messagingSenderId: '886504217577',
    projectId: 'inventory-management-b610f',
    storageBucket: 'inventory-management-b610f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBj67ndOSsibPFEl8nY6Jl6S7aHfZAcCPc',
    appId: '1:886504217577:ios:093bde122b88f04c178978',
    messagingSenderId: '886504217577',
    projectId: 'inventory-management-b610f',
    storageBucket: 'inventory-management-b610f.firebasestorage.app',
    iosBundleId: 'com.example.inventorymanagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBj67ndOSsibPFEl8nY6Jl6S7aHfZAcCPc',
    appId: '1:886504217577:ios:093bde122b88f04c178978',
    messagingSenderId: '886504217577',
    projectId: 'inventory-management-b610f',
    storageBucket: 'inventory-management-b610f.firebasestorage.app',
    iosBundleId: 'com.example.inventorymanagement',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBY5FFkT35A6wfp8MnRk5CdArCz-yNR8wI',
    appId: '1:886504217577:web:4cd0c3c5c61b79d0178978',
    messagingSenderId: '886504217577',
    projectId: 'inventory-management-b610f',
    authDomain: 'inventory-management-b610f.firebaseapp.com',
    storageBucket: 'inventory-management-b610f.firebasestorage.app',
    measurementId: 'G-SXXG9MGXPB',
  );
}
