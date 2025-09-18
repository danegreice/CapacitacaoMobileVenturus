import 'package:aplicativo_series/custom_drawer.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eu amo séries')),
      drawer: CustomDrawer(),
      body: child,
    );
  }
}
