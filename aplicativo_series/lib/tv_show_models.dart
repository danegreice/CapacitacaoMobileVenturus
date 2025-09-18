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

  void addTvShow(TvShow tvShow, BuildContext context) {
    tvShows.add(tvShow);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${tvShow.title} adicionado com sucesso!',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  void removeTvShow(TvShow tvShow, BuildContext context) {
    final indice = tvShows.indexOf(tvShow);
    tvShows.remove(tvShow);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${tvShow.title} removido com sucesso!'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            tvShows.insert(indice, tvShow);
            notifyListeners();
          },
        ),
      ),
    );
    notifyListeners();
  }

  void updateTvShow(TvShow oldTvShow, TvShow newTvShow, BuildContext context) {
    final indice = tvShows.indexOf(oldTvShow);
    tvShows[indice] = newTvShow;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Série ${indice + 1} atualizado com sucesso!'),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }
}
