import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tv_show_card.dart';
import 'tv_show_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var color = Colors.purple;

    var colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );

    var colorSchemeDark = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );

    var customTheme = ThemeData(
      colorScheme: colorScheme,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorScheme.primary,
        titleTextStyle: GoogleFonts.lobster(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorScheme.onPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.primaryContainer,
        shadowColor: colorScheme.onSurface,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    var customThemeDark = ThemeData(
      colorScheme: colorSchemeDark,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: colorSchemeDark.primary,
        titleTextStyle: GoogleFonts.lobster(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: colorSchemeDark.onPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: colorSchemeDark.primaryContainer,
        shadowColor: colorSchemeDark.onSurface,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      darkTheme: customThemeDark,
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(title: Text('Eu amo séries')),
        //body: ListView(
        //  children: [
        //    ...favTvShowList.map((tvShow) => TvShowCard(tvShow: tvShow)),
        //  ],
        //),
        body: ListView.builder(
          itemBuilder: (context, index) =>
              TvShowCard(tvShow: favTvShowList[index], index: index),
          itemCount: favTvShowList.length,
        ),
      ),
    );
  }
}
