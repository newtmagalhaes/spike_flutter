import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card.outlined(
        child: Column(
          children: [
            Text('App Título'),
            // TextInput()
          ],
        ),
      ),
    );
  }
}
