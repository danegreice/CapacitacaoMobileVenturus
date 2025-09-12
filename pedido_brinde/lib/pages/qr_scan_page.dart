import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

//import 'criar_pedido_page.dart'; // certifique-se de importar sua tela de pedido

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  bool isScanned = false;
  Map<String, dynamic>? clienteData;

  void _handleScan(String data) {
    try {
      final decoded = jsonDecode(data);
      if (decoded is Map<String, dynamic>) {
        setState(() {
          clienteData = decoded;
          isScanned = true;
        });
      } else {
        // JSON inválido
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('QR Code inválido')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao ler QR Code')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ler QR Code do Cliente')),
      body: clienteData != null
          ? _buildClienteInfo()
          : Stack(
              children: [
                MobileScanner(
                  controller: MobileScannerController(
                    facing: CameraFacing.back,
                    detectionSpeed: DetectionSpeed.normal,
                    formats: [BarcodeFormat.qrCode],
                  ),
                  onDetect: (capture) {
                    if (isScanned) return;
                    final List<Barcode> barcodes = capture.barcodes;
                    for (final barcode in barcodes) {
                      final String? raw = barcode.rawValue;
                      if (raw != null) {
                        _handleScan(raw);
                        break;
                      }
                    }
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'Aponte a câmera para o QR Code',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildClienteInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Cliente: ${clienteData!['nome']}',
            style: const TextStyle(fontSize: 18),
          ),
          Text('CNPJ: ${clienteData!['cnpj']}'),
          Text('Email: ${clienteData!['email']}'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              /*
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CriarPedidoPage(cliente: clienteData!),
                ),
              ); */
            },
            child: const Text('Criar Pedido'),
          ),
        ],
      ),
    );
  }
}
