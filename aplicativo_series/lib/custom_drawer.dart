import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.switchTheme,
    required this.isDarkTheme,
    required this.switchScreen,
  });

  final Function() switchTheme;
  final Function(int) switchScreen;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Eu amo séries',
                    style: GoogleFonts.lobster(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: switchTheme,
                    icon: isDarkTheme
                        ? Icon(Icons.wb_sunny_rounded, size: 24)
                        : Icon(Icons.nightlight_round_sharp, size: 24),
                    label: Text('Mudar Tema'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              switchScreen(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Adicionar série'),
            onTap: () {
              switchScreen(1);
              Navigator.pop(context);
            },
          ),
          // Add more list tiles for additional items
        ],
      ),
    );
  }
}
