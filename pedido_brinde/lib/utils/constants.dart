import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFF9800); // Laranja
  static const Color secondary = Color(0xFFFF5722); // Laranja escuro
  static const Color white = Colors.white;
  static const Color light = Color(0xFFFFE0B2);
}

class AppText {
  static const String appName = "Pedido Brinde";
}

class AppRoutes {
  static const String URL_BASE =
      'https://www.amazongas.com.br/API-GATEWAY/Mobile/Modulo-AppPedidos/index.php';
  static const String URL_SIGASWEB_FAT =
      'https://websigas.amazongas.com.br/API-GATEWAY/Sigasweb/Modulo-Faturamento/index-MonitorNFE.php';
  static const String URL_CD =
      'https://www.amazongas.com.br/API-GATEWAY/Mobile/modulo-appcentrodistribuicao-new/index.phpcons';
}
