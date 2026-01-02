import 'dart:convert';

import 'package:spike_flutter/interfaces/models/anime/item_anime.dart';
import 'package:spike_flutter/widgets/constants/enum/season.dart';
import 'package:http/http.dart' as http;
abstract interface class SeasonalAnime {
  List<ItemAnime> get data;
}

class MalAPI {
  const MalAPI();

  final String baseUrl = 'https://api.myanimelist.net/v2';

  Future<String> getSeasonalAnime(int year, AnimeSeason season) async {
    var response = await http.get(Uri.parse('$baseUrl/anime/season/$year/$season'));
    // var temp = jsonDecode(response.body);
    return response.body;
  }
}
