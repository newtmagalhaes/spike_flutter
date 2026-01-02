import 'package:spike_flutter/pages/anime/season.dart';
import 'package:spike_flutter/pages/auth/login.dart';
import 'package:spike_flutter/pages/home.dart';
import 'package:spike_flutter/widgets/constants/enum/season.dart';

class Routes {

  static final INITIAL = '/';

  static final ROUTES = {
    '/': (context) => const HomePage(),
    '/auth/login': (context) => const LoginPage(),
    '/anime': (context) => const SeasonalAnimePage(year: 2024, season: AnimeSeason.winter)
  };
}
