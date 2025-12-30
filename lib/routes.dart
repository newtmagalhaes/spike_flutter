import 'package:spike_flutter/pages/auth/login.dart';
import 'package:spike_flutter/pages/home.dart';

class Routes {

  static final INITIAL = '/';

  static final ROUTES = {
    '/': (context) => const HomePage(),
    '/auth/login': (context) => const LoginPage(),
  };
}
