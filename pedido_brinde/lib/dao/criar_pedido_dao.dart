import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:pedido_brinde/utils/constants.dart';

Future<bool> criarPedido(
  String filial,
  Map<String, dynamic> jsonDados,
  List<Map<String, dynamic>> jsonListaItens,
) async {
  var logger = Logger();
  final queryBody = <String, dynamic>{};

  if (filial.isNotEmpty) queryBody['filial'] = filial;
  if (jsonDados.isNotEmpty) queryBody['jsonDados'] = jsonDados;
  if (jsonListaItens.isNotEmpty) queryBody['jsonListaItens'] = jsonListaItens;

  final uri = Uri.parse('${AppRoutes.URL_BASE}/pedido');
  logger.i('uri: $uri');
  final response = await http.post(
    uri,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(queryBody),
  );
  logger.i('response body: ${response.body}');
  logger.i('response status: ${response.statusCode}');

  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Erro ao criar pedido');
  }
}
