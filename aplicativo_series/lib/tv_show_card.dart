import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'tv_show_models.dart';
import 'tv_show_rating.dart';
import 'package:google_fonts/google_fonts.dart';

class TvShowCard extends StatelessWidget {
  const TvShowCard({super.key, required this.tvShow, required this.index});

  final TvShow tvShow;
  final int index;
  //final Function(TvShow) removeTvShow;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary,
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.lobster(color: colorScheme.onPrimary),
          ),
        ),
        title: Text(
          tvShow.title,
          style: GoogleFonts.lobster(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          tvShow.stream,
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
        ),
        trailing: ratingWidget(number: tvShow.rating),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tvShow.title,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, size: 30),
                  ),
                ],
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Stream: ${tvShow.stream}'),
                  Text('Rating: ${tvShow.rating}'),
                  Text(tvShow.summary),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context.read<TvShowModel>().removeTvShow(tvShow, context);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  child: Text(
                    'Excluir',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final index = context.read<TvShowModel>().tvShows.indexOf(
                      tvShow,
                    );
                    Navigator.of(context).pop();
                    context.go('/edit/$index');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  child: Text(
                    'Editar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
