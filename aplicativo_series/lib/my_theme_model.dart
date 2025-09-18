import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeModel extends ChangeNotifier {
  bool isDark = false;
  MyTheme myTheme = MyTheme(color: Colors.tealAccent);
  ThemeData get customTheme => myTheme.customTheme;
  ThemeData get customThemeDark => myTheme.customThemeDark;
  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class MyTheme {
  Color color;
  late ColorScheme colorScheme;
  late ColorScheme colorSchemeDark;
  late ThemeData customTheme;
  late ThemeData customThemeDark;

  MyTheme({required this.color}) {
    colorScheme = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.light,
    );

    colorSchemeDark = ColorScheme.fromSeed(
      seedColor: color,
      brightness: Brightness.dark,
    );

    customTheme = ThemeData(
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
        iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorScheme.primaryContainer,
        shadowColor: colorScheme.onSurface,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );

    customThemeDark = ThemeData(
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
        iconTheme: IconThemeData(color: colorSchemeDark.onPrimary, size: 36),
      ),
      cardTheme: CardThemeData(
        color: colorSchemeDark.primaryContainer,
        shadowColor: colorSchemeDark.onSurface,
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
