import 'package:aplicativo_series/tv_show_models.dart';
import 'package:flutter/material.dart';
import 'tv_show_card.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key, required this.tvShows});

  final List<TvShow> tvShows;

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          TvShowCard(tvShow: widget.tvShows[index], index: index),
      itemCount: widget.tvShows.length,
    );
  }
}
