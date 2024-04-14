
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCsla2omExhruwjqOp__PtSKLN_hHmunjc',
    appId: '1:571972156725:web:f083ae84e2489c0db0207c',
    messagingSenderId: '571972156725',
    projectId: 'moulvibazar-city-apps',
    authDomain: 'moulvibazar-city-apps.firebaseapp.com',
    storageBucket: 'moulvibazar-city-apps.appspot.com',
    measurementId: 'G-1KJN31ZJMH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9XG9Jlz1nsm_oBwlyGPt7z9SfG0HShAs',
    appId: '1:571972156725:android:d573ff0cf479cff2b0207c',
    messagingSenderId: '571972156725',
    projectId: 'moulvibazar-city-apps',
    storageBucket: 'moulvibazar-city-apps.appspot.com',
  );
}
