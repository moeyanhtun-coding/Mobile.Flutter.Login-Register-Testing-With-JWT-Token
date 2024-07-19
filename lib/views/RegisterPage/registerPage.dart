// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _header(context, 0.1),
          _formGroup(context),
          _login(),
        ],
      ),
    );
  }

  Widget _formGroup(context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _inputField(context, "Usernae", 0.03, Icons.person, false),
          _gap(context, 0.02),
          _inputField(context, "Email", 0.03, Icons.mail, false),
          _gap(context, 0.02),
          _inputField(context, "Password", 0.03, Icons.password, true),
          _gap(context, 0.02),
          _inputField(context, "Confirm Password", 0.03, Icons.password, true),
          _gap(context, 0.02),
          _signUpButton(context)
        ],
      ),
    );
  }

  Widget _header(context, double size) {
    return Column(
      children: [
        Text(
          "Sign Up",
          style: TextStyle(
              fontSize: MediaQuery.sizeOf(context).width * size,
              fontWeight: FontWeight.bold),
        ),
        _gap(context, 0.025),
        const Text("Create Your Account")
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
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.greenAccent.withOpacity(0.2),
            filled: true,
            prefixIcon: Icon(icon),
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }

  Widget _signUpButton(context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAllNamed('/home');
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 10),
          backgroundColor: Colors.greenAccent),
      child: const Text(
        "Sign Up",
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  Widget _login() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Get.offAllNamed('/');
          },
          child: const Text(
            "Sign In",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  Widget _gap(context, double size) {
    return Gap(MediaQuery.sizeOf(context).width * size);
  }
}
