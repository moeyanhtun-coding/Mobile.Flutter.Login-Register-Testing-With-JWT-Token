import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_design_login_register/api/firebaseApi.dart';
import 'package:ui_design_login_register/services/auth_service.dart';
import 'package:ui_design_login_register/utils.dart';
import 'package:ui_design_login_register/views/LoginPage/loginPage.dart';
import 'package:ui_design_login_register/views/NotificationPage/notificationPage.dart';
import 'package:ui_design_login_register/views/RegisterPage/registerPage.dart';
import 'package:ui_design_login_register/views/HomePage/homePage.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  await _sertUp();
  runApp(MyApp());
}

Future<void> _sertUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpFirebase();
  await FirebaseApi().initNotification();
  await registerService();
}

class MyApp extends StatelessWidget {
  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  final routes = [
    GetPage(name: '/login', page: () => const Loginpage()),
    GetPage(name: '/register', page: () => const Registerpage()),
    GetPage(name: '/home', page: () => const Homepage()),
    GetPage(name: '/notification', page: () => const Notificationpage()),
  ];
  MyApp({super.key}) {
    _authService = _getIt<AuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: _authService.user != null ? "/home" : "/login",
      getPages: routes,
    );
  }
}
