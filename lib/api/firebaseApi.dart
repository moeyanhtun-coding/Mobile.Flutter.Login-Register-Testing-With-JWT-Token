import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ui_design_login_register/main.dart';

class FirebaseApi {
  //create an instance of firebase messagin
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initNotification() async {
    // request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();

    // fetch the FCM Token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token (normally you would send this to your server)
    print("Token: $fCMToken");

    initPushNotifications();
  }

  // function to handle received message
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    // navigate to new screen when message is received and user test notification
    navigatorKey.currentState?.pushNamed("/notification", arguments: message);
  }

  Future initPushNotifications() async {
    // handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners for when a notifications opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
