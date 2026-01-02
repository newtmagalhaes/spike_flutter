
import 'package:flutter/material.dart';
import 'package:spike_flutter/interfaces/api/mal.dart';
import 'package:spike_flutter/widgets/constants/enum/season.dart';

class SeasonalAnimePage extends StatelessWidget {
  const SeasonalAnimePage({super.key, required this.year, required this.season});

  final int year;
  final AnimeSeason season;
  final MalAPI _malAPI = const MalAPI();

  @override
  Widget build(BuildContext context) {
    var animes = _malAPI.getSeasonalAnime(year, season);
    return Scaffold(
      appBar: AppBar(title: Text('$year - $season Season'),),
      body: Container(
        alignment: .center,
        child: Column(
          children: [
            Text('anime item')
          ],
        ),
      ),
    );
  }
  
}
