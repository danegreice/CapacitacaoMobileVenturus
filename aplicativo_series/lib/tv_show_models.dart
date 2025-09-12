import 'package:aplicativo_series/tv_show_data.dart';
import 'package:flutter/material.dart';

class TvShow {
  String title;
  String stream;
  int rating;
  String summary;

  TvShow({
    required this.title,
    required this.stream,
    required this.rating,
    required this.summary,
  });
}

class TvShowModel extends ChangeNotifier {
  final List<TvShow> _tvShows = favTvShowList;
  List<TvShow> get tvShows => _tvShows;

  void addTvShow(TvShow tvShow) {
    tvShows.add(tvShow);
    notifyListeners();
  }

  void removeTvShow(TvShow tvShow) {
    tvShows.remove(tvShow);
    notifyListeners();
  }
}
