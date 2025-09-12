import 'package:flutter/material.dart';
import 'package:pedido_brinde/pages/buscar_cliente_page.dart';
import 'package:pedido_brinde/pages/qr_scan_page.dart';
import 'pages/home_page.dart';
import 'pages/criar_pedido_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Pedidos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/buscar_cliente': (context) => PesquisarClientePage(),
        '/qr_scan': (context) => const QRScanPage(),
        '/criar_pedido': (context) => CriarPedidoPage(),
      },
    );
  }
}
