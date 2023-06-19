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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3W_pGoNWsqspziWTtu7XoWtwlxy-t71Q',
    appId: '1:1065284918592:android:64d4b9665a21ab788e6ea5',
    messagingSenderId: '1065284918592',
    projectId: 'marvel-sarchive',
    storageBucket: 'marvel-sarchive.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDburB_wbmn0orEsjrKVIWbsW2-yKCVIhs',
    appId: '1:1065284918592:ios:466d5f5b9aa941c78e6ea5',
    messagingSenderId: '1065284918592',
    projectId: 'marvel-sarchive',
    storageBucket: 'marvel-sarchive.appspot.com',
    androidClientId: '1065284918592-53u220q9h7q3rumd23piho1hmd4suk1a.apps.googleusercontent.com',
    iosClientId: '1065284918592-gmenuo5slm5mqcm60a29a94fqsrj0baq.apps.googleusercontent.com',
    iosBundleId: 'com.mottu.marvel.marvelsarchive',
  );
}