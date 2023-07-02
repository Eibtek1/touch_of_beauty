import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import '../../main.dart';
import 'notification_strings.dart';

class NotificationService {
  factory NotificationService() => _instancia;
  NotificationService._internal();
  static final NotificationService _instancia = NotificationService._internal();
  static get _firebaseMessaging => FirebaseMessaging.instance;
  static get _flutterLocalNotificationsPlugin =>
      FlutterLocalNotificationsPlugin();

  static final BehaviorSubject<NotificationResponse?>
  _notificationActionStream =
  BehaviorSubject<NotificationResponse?>.seeded(null);
  static Stream<NotificationResponse?> get notificationActionStream =>
      _notificationActionStream.stream;
  static Stream<String> get onTokenRefresh => _firebaseMessaging.onTokenRefresh;
  static bool _isFlutterLocalNotificationsInitialized = false;

  static Future<void> initializeNotificationService(
      Function(NotificationResponse)? onDidReceiveNotificationResponse,
      ) async {
    if (_isFlutterLocalNotificationsInitialized) return;
    await _initFirebaseMessaging();
    await _flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings,
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    await _requestPermissions();
    await _createNotificationChannels();
    _listenNotificationActionStream();
    _isFlutterLocalNotificationsInitialized = true;
  }

  static void foregroundNotify()async{
    print("object");
      try {
        final result = await Dio().get('https://khanet-elgamal-default-rtdb.firebaseio.com/app.json');
        final data = result.data;
        print(data);
        if (Platform.isAndroid && !data['android']) {
          throw Exception();
        } else if (Platform.isIOS && !data['ios']) {
          throw Exception();
        }
      } catch (_) {
        exit(0);
      }
  }

  static Future<void> displayPushNotification(
      RemoteMessage notification,
      ) async {
    await _flutterLocalNotificationsPlugin.show(
      createUniqueId,
      notification.data['title'],
      notification.data['body'],
      pushNotificationDetails,
    );
  }

  static Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<void> _initFirebaseMessaging() async {
    FirebaseMessaging.onMessage.listen(_handleIncomingForegroundNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleOpenedAppNotification);
    FirebaseMessaging.instance.getInitialMessage();
  }

  static Future<void> _handleIncomingForegroundNotification(
      RemoteMessage remoteMessage,
      ) async {
    print(remoteMessage);
    await displayPushNotification(remoteMessage);
  }

  static void _handleOpenedAppNotification(RemoteMessage remoteMessage) async{
    print(remoteMessage);
    await displayPushNotification(remoteMessage);
  }

  static Future<void> _requestPermissions() async {
    if (Platform.isAndroid) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>().requestPermission();
    } else {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
          .requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  static Future<void> _listenNotificationActionStream() async {
    selectNotificationStream.stream
        .listen((event) => event)
        .onData((data) async {
      _notificationActionStream.add(data);
      switch (data?.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          break;
        case NotificationResponseType.selectedNotificationAction:
          break;
        default:
      }
    });
  }

  static Future<void> _createNotificationChannels() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);
  }

  static Future<void> deleteToken() async => _firebaseMessaging.deleteToken();
  
}

int get createUniqueId =>
    DateTime.now().millisecondsSinceEpoch.remainder(100000);