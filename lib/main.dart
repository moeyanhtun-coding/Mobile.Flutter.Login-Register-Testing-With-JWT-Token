import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_design_login_register/api/firebaseApi.dart';
import 'package:ui_design_login_register/firebase_options.dart';
import 'package:ui_design_login_register/views/LoginPage/loginPage.dart';
import 'package:ui_design_login_register/views/NotificationPage/notificationPage.dart';
import 'package:ui_design_login_register/views/RegisterPage/registerPage.dart';
import 'package:ui_design_login_register/views/HomePage/homePage.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = [
    GetPage(name: '/', page: () => const Loginpage()),
    GetPage(name: '/register', page: () => const Registerpage()),
    GetPage(name: '/home', page: () => const Homepage()),
    GetPage(name: '/notification', page: () => const Notificationpage()),
  ];
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      getPages: routes,
      home: Scaffold(
        appBar: AppBar(),
        body: const Loginpage(),
      ),
    );
  }
}
