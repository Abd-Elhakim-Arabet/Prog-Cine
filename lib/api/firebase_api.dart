import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:prog/services/storage/shared_pref.dart';
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
  print('Message title: ${message.notification?.title}');
  print('Message body: ${message.notification?.body}');
  print('Message data: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();
  
  Future<void> subscribeToGlobalTopicOnce() async {
    bool isSubscribed = SharedPref.getAllowNotifications()?? false;
    if (!isSubscribed){
      _firebaseMessaging.subscribeToTopic('global');
      log('User subscribed to Global Topic');
    }
    else{
      log('User already subscribed, skipping ..');
    }
  }

  void handleMessage(RemoteMessage? message){
    if (message == null) return;
    // we should navigate to another screen now but uhmm
  }

  Future initLocalNotification() async {
    const iOS = DarwinInitializationSettings();
    final android = AndroidInitializationSettings('@drawable/mdlogo');
    final settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (response){
        final message = RemoteMessage.fromMap(jsonDecode(response.payload!));
        handleMessage(message);
      }
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }


  Future initPushNotification()async {
    // this is essential for IOS to work
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // this is responsible when the is opened from terminated state via notification
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    // this is responsible when the app is in background and opened via notification
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // this listener triggers whenever a new message is received in the foreground
    FirebaseMessaging.onMessage.listen((message){
        final notification = message.notification;
        if (notification == null) return;
        _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription:_androidChannel.description,
              // for the icon we need to go to android/app/src/main/res/drawable
              icon: '@drawable/ic_launcher',
              importance: Importance.max,
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
    });

  }



  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final  fCMToken =  await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');
    await initPushNotification();
    await initLocalNotification();
    await subscribeToGlobalTopicOnce();
  }
}
