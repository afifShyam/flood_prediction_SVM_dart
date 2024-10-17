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
    apiKey: 'AIzaSyCkiLTWiqCzlydViydLajswUYayw-1b9LE',
    appId: '1:735500158242:web:01650b6e4cfb43808c517b',
    messagingSenderId: '735500158242',
    projectId: 'flood-aware',
    authDomain: 'flood-aware.firebaseapp.com',
    databaseURL: 'https://flood-aware-default-rtdb.firebaseio.com',
    storageBucket: 'flood-aware.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3bN-FT2WvElKMJY4AXrMEpbbM3WIweP0',
    appId: '1:735500158242:android:13777f6e7c0cac608c517b',
    messagingSenderId: '735500158242',
    projectId: 'flood-aware',
    databaseURL: 'https://flood-aware-default-rtdb.firebaseio.com',
    storageBucket: 'flood-aware.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpvxqgJJLHmD8Abgjh3rIv4YnMUSBEess',
    appId: '1:735500158242:ios:ec73a402a2e98cbd8c517b',
    messagingSenderId: '735500158242',
    projectId: 'flood-aware',
    databaseURL: 'https://flood-aware-default-rtdb.firebaseio.com',
    storageBucket: 'flood-aware.appspot.com',
    androidClientId: '735500158242-6kb12lsbm48b628vb3c5uoipi28ktp1a.apps.googleusercontent.com',
    iosClientId: '735500158242-ajjh6bpnvumqfttjuslfv6j204b1bemv.apps.googleusercontent.com',
    iosBundleId: 'com.example.fyp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpvxqgJJLHmD8Abgjh3rIv4YnMUSBEess',
    appId: '1:735500158242:ios:f8c92b373d78290f8c517b',
    messagingSenderId: '735500158242',
    projectId: 'flood-aware',
    databaseURL: 'https://flood-aware-default-rtdb.firebaseio.com',
    storageBucket: 'flood-aware.appspot.com',
    androidClientId: '735500158242-6kb12lsbm48b628vb3c5uoipi28ktp1a.apps.googleusercontent.com',
    iosClientId: '735500158242-pulu6g9ftpscu4bbe9c06l479q1ptrt2.apps.googleusercontent.com',
    iosBundleId: 'com.example.fyp.RunnerTests',
  );
}
