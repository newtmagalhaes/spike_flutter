import 'package:spike_flutter/ui/views/auth/login.dart';
import 'package:spike_flutter/ui/views/home.dart';

class Routes {

  static final INITIAL = '/';

  static final ROUTES = {
    '/': (context) => const HomePage(),
    '/auth/login': (context) => const LoginPage(),
  };
}
