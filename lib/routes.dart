import 'package:flutter/material.dart';
import 'package:spike_flutter/ui/views/auth/login.dart';
import 'package:spike_flutter/ui/views/home.dart';
import 'package:spike_flutter/ui/views/users.dart';

class Routes {

  static final INITIAL = '/';

  static final Map<String, WidgetBuilder> ROUTES = {
    '/': (context) => const HomePage(),
    '/auth/login': (context) => const LoginPage(),
    '/users': (context) => const UsersPage(),
  };
}
