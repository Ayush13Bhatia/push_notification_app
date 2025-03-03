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
    apiKey: 'AIzaSyBHMMqFW2zvbq5f4JFUWiX_H6MM5jlNokg',
    appId: '1:609128673960:web:f146d90b8586006d0f889d',
    messagingSenderId: '609128673960',
    projectId: 'fir-app-69df7',
    authDomain: 'fir-app-69df7.firebaseapp.com',
    storageBucket: 'fir-app-69df7.firebasestorage.app',
    measurementId: 'G-SB1FYZRKHH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAj4-VyobUPsbqbPtzEpb_Eghhz4rZy5Uk',
    appId: '1:609128673960:android:d1323ddc1f3129500f889d',
    messagingSenderId: '609128673960',
    projectId: 'fir-app-69df7',
    storageBucket: 'fir-app-69df7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCK3MArgSwpy1ctODF0Yxo3J2awof3mpA',
    appId: '1:609128673960:ios:de375113bdbc679f0f889d',
    messagingSenderId: '609128673960',
    projectId: 'fir-app-69df7',
    storageBucket: 'fir-app-69df7.firebasestorage.app',
    iosBundleId: 'com.example.firebaseApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCK3MArgSwpy1ctODF0Yxo3J2awof3mpA',
    appId: '1:609128673960:ios:de375113bdbc679f0f889d',
    messagingSenderId: '609128673960',
    projectId: 'fir-app-69df7',
    storageBucket: 'fir-app-69df7.firebasestorage.app',
    iosBundleId: 'com.example.firebaseApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBHMMqFW2zvbq5f4JFUWiX_H6MM5jlNokg',
    appId: '1:609128673960:web:a4c405d73573687e0f889d',
    messagingSenderId: '609128673960',
    projectId: 'fir-app-69df7',
    authDomain: 'fir-app-69df7.firebaseapp.com',
    storageBucket: 'fir-app-69df7.firebasestorage.app',
    measurementId: 'G-XT87C1D035',
  );
}
