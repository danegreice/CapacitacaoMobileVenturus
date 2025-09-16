import 'package:aplicativo_series/tv_show_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tv_show_card.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key});

  //final List<TvShow> tvShows;
  //final Function(TvShow) removeTvShow;

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<TvShowModel>(
      context,
    ); // listen:false para nao causar reconstrução da tela
    //var model = context.watch<TVShowModel>();
    return ListView.builder(
      itemBuilder: (context, index) => Consumer<TvShowModel>(
        builder: (context, model, child) =>
            TvShowCard(tvShow: model.tvShows[index], index: index),
      ),
      itemCount: model.tvShows.length,
    );
  }
}
