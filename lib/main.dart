import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_design_login_register/views/LoginPage/loginPage.dart';
import 'package:ui_design_login_register/views/RegisterPage/registerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = [
    GetPage(name: '/', page: () => const Loginpage()),
    GetPage(name: '/register', page: () => const Registerpage()),
  ];
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: routes,
      home: Scaffold(
        appBar: AppBar(),
        body: Loginpage(),
      ),
    );
  }
}
