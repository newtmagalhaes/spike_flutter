import 'package:flutter/material.dart';
import 'package:spike_flutter/data/forms/auth/login_form.dart';
import 'package:spike_flutter/ui/components/nav_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarMenu(title: 'Login'),
      body: Container(
        alignment: .center,
        child: SizedBox.fromSize(
          size: Size.square(400),
          child: Card.outlined(child: LoginForm()),
        ),
      ),
    );
  }
}
