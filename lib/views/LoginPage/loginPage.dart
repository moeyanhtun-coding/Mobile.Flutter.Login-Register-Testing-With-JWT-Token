// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_design_login_register/consts.dart';
import 'package:ui_design_login_register/services/auth_service.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final GetIt _getIt = GetIt.instance;
  final GlobalKey<FormState> _LoginForm = GlobalKey();
  late AuthService _authService;

  String? email, password;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildUI(context, 0.15),
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
      child: Form(
        key: _LoginForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _inputField(context, "Email", 0.03, Icons.email, false,
                EMAIL_VALIDATION_REGEX, (value) {
              setState(() {
                email = value;
              });
            }),
            _gap(context, 0.02),
            _inputField(
              context,
              "Password",
              0.03,
              Icons.password,
              true,
              PASSWORD_VALIDATION_REGEX,
              (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            _gap(context, 0.02),
            _loginButton(context),
            _gap(context, 0.02),
            _forgotPassword(),
          ],
        ),
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

  Widget _inputField(
      context,
      String formName,
      double borderRadius,
      IconData icon,
      bool obscureText,
      RegExp validationRegEx,
      Function(String?) onSaved) {
    return Column(
      children: [
        TextFormField(
          onSaved: onSaved,
          validator: (value) {
            if (value != null && validationRegEx.hasMatch(value)) {
              return null;
            }
            return "Enter a valid ${formName.toLowerCase()}";
          },
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
      onPressed: () async {
        if (_LoginForm.currentState?.validate() ?? false) {
          _LoginForm.currentState?.save();
          bool result = await _authService.Login(email!, password!);
          if (result) {
            Get.offAllNamed("/home");
          }
        }
      },
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
