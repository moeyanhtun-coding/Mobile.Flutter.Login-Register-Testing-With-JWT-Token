// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildUI(context, 0.15),
    );
  }

  Widget _buildUI(context, double size) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _header(context, 0.1),
            _formGroup(context),
            const Stack(),
          ],
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: _singUp(),
        ),
      ],
    );
  }

  Widget _formGroup(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _inputField(context, "Username", 0.03, Icons.person, false),
          _gap(context, 0.02),
          _inputField(context, "Password", 0.03, Icons.password, true),
          _gap(context, 0.02),
          _loginButton(context),
          _gap(context, 0.02),
          _forgotPassword(),
        ],
      ),
    );
  }

  Widget _header(context, double size) {
    return Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).width * size,
              fontWeight: FontWeight.bold),
        ),
        const Text("Enter your credential to login")
      ],
    );
  }

  Widget _inputField(context, String formName, double borderRadius,
      IconData icon, bool obscureText) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: formName,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.sizeOf(context).width * borderRadius),
                borderSide: BorderSide.none),
            fillColor: Colors.greenAccent.withOpacity(0.2),
            filled: true,
            prefixIcon: Icon(icon),
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }

  Widget _loginButton(context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: Colors.greenAccent),
      child: const Text(
        "Login",
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  Widget _forgotPassword() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _singUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account? "),
        TextButton(
          onPressed: () {
            Get.toNamed('/register');
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _gap(context, double size) {
    return Gap(MediaQuery.sizeOf(context).width * size);
  }
}
