import 'package:aplicativo_series/tv_show_models.dart';
import 'package:flutter/material.dart';
import 'tv_show_card.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({
    super.key,
    required this.tvShows,
    required this.removeTvShow,
  });

  final List<TvShow> tvShows;
  final Function(TvShow) removeTvShow;

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  Widget build(BuildContext context) {
    //var model = Provider.of<TvShowModel>(context, listen: false);
    //var model = context.read()
    return ListView.builder(
      itemBuilder: (context, index) => TvShowCard(
        tvShow: widget.tvShows[index],
        index: index,
        removeTvShow: widget.removeTvShow,
      ),
      itemCount: widget.tvShows.length,
    );
  }
}
