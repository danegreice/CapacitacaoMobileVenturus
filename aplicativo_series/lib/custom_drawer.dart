import 'package:aplicativo_series/my_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
                    onPressed: context.read<MyThemeModel>().switchTheme,
                    icon: context.watch<MyThemeModel>().isDark
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
              Navigator.pop(context);
              context.go('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Adicionar série'),
            onTap: () {
              Navigator.pop(context);
              context.go('/add');
            },
          ),
          // Add more list tiles for additional items
        ],
      ),
    );
  }
}
