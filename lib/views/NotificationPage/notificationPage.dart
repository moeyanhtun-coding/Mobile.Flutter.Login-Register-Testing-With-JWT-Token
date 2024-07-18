import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  final TextEditingController _controller = TextEditingController();

  void _sendNotification(String message) async {
    final url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/myproject-b5ae1/messages:send');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDH+ZkkEe3WzzJP'
    };
    final body = {
      "message": {
        "token":
            "eLWs_jZ8TrOFixQePkGpA7:APA91bHk4HVDCMY9F62NXZD6CDGhX_2qrpbIiT-yicOXmRjSIoSWZ1bVQZ7Fjo5ejIKgaVm1YUMs50i4j8IKL3Wn-wE7CsGvgtcluYeOjbSHiQBoTMXLTMUaI0eCSMw0T328JgWI4Yf3",
        "topic": "news",
        "notification": {"title": "new message", "body": message},
        "data": {"story_id": "story_12345"}
      }
    };

    final response =
        await http.post(url, headers: headers, body: json.encode(body));
    if (response.statusCode == 200) {
      print("Notification sent successfully");
    } else {
      print("Failed to send notification");
    }
  }

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: _header(),
      ),
      body: _buildUI(message),
    );
  }

  Widget _header() {
    return Text("Message Example");
  }

  Widget _buildUI(RemoteMessage message) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            _message(message.notification!.title.toString()),
            _message(message.notification!.body.toString()),
            _message(message.data.toString()),
            _sizeBoxHeight(30),
            _inputField(),
            _button()
          ],
        ),
      ),
    );
  }

  Widget _message(String message) {
    return Text(message);
  }

  Widget _inputField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(labelText: 'Message'),
    );
  }

  Widget _sizeBoxHeight(double size) {
    return SizedBox(height: size);
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        final message = _controller.text;
        _sendNotification(message);
      },
      child: Text('Send Notification'),
    );
  }
}
