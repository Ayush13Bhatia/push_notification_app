import 'dart:convert';

import 'package:firebase_app/notification_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'main.dart';


void backgroundNotification(payload) {
  debugPrint('🔔 Notification clicked in background: ${payload.payload}');

  if (payload.payload != null) {
    try {
      final Map<String, dynamic> data = jsonDecode(payload.payload!);
      debugPrint('📩 Decoded Payload Data: $data');

      final message = RemoteMessage.fromMap(data);
      debugPrint('✅ Parsed RemoteMessage: ${message.data}');

      handleMessage(message);
    } catch (e) {
      debugPrint('❌ Error parsing notification payload: $e');
    }
  } else {
    debugPrint('⚠️ No payload found in notification response.');
  }
}

Future<void> handleBackGroundMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body ${message.notification?.body}");
  print("Payload:  ${message.data}");
  print('object12');
  if (message == null) return;

  debugPrint('🔔 New Notification Received: ${message.notification?.title}');

  if (navigatorKey.currentState != null) {
    navigatorKey.currentState!.pushNamed(
      NotificationScreen.route,
      arguments: message,
    );
  } else {
    debugPrint('❗ Navigator key is null, cannot navigate.');
  }
  print("Title: ${message.notification?.title}");
  print("Body ${message.notification?.body}");
  print("Payload:  ${message.data}");
}

final _localNotification = FlutterLocalNotificationsPlugin();

void handleMessage(RemoteMessage? message) {
  print('object11');
  if (message == null) return;

  debugPrint('🔔 New Notification Received: ${message.notification?.title}');

  if (navigatorKey.currentState != null) {
    navigatorKey.currentState!.pushNamed(
      NotificationScreen.route,
      arguments: message,
    );
  } else {
    debugPrint('❗ Navigator key is null, cannot navigate.');
  }
}

Future initPushNotification() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    sound: true,
    badge: true,
  );
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
  FirebaseMessaging.onMessage.listen((message) {
    final notificaiton = message.notification;
    if (notificaiton == null) return;
    _localNotification.show(
      notificaiton.hashCode,
      notificaiton.title,
      notificaiton.body,
      payload: jsonEncode(message.toMap()),
      NotificationDetails(
        android: AndroidNotificationDetails(
          message.senderId ?? "",
          message.messageId ?? "",
          icon: "@mipmap/ic_launcher",
          playSound: true,
          groupKey: navigatorKey.toString(),
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  });
}

Future initLocalNotification() async {
  const iOS = DarwinInitializationSettings();
  const android = AndroidInitializationSettings("@mipmap/ic_launcher");
  const setting = InitializationSettings(android: android, iOS: iOS);

  ///Initialize local notification
  await _localNotification.initialize(setting, onDidReceiveBackgroundNotificationResponse: backgroundNotification, onDidReceiveNotificationResponse: backgroundNotification);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
    print("Fcm_token: ${fCMToken}");
    initPushNotification();
    initLocalNotification();
  }
}
