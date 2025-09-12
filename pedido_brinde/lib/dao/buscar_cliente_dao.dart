import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:pedido_brinde/utils/constants.dart';
import 'package:pedido_brinde/models/Cliente.dart';

Future<List<Cliente>> buscarClientes({String? nome, String? codigo}) async {
  var logger = Logger();
  final queryParams = <String, String>{};
  if (nome != null && nome.isNotEmpty) queryParams['nome'] = nome;
  if (codigo != null && codigo.isNotEmpty) queryParams['codigo'] = codigo;
  final uri = Uri.parse(
    '${AppRoutes.URL_BASE}/clientes',
  ).replace(queryParameters: queryParams);
  logger.i('uri: $uri');
  final response = await http.get(uri);
  logger.i('response body: ${response.body}');
  logger.i('response status: ${response.statusCode}');

  if (response.statusCode == 200) {
    final body = response.body;

    if (body != null && body.isNotEmpty && body != 'null') {
      final List json = jsonDecode(body);
      return json.map((item) => Cliente.fromJson(item)).toList();
    } else {
      return [];
    }
  } else {
    throw Exception('Erro ao buscar clientes. Código: ${response.statusCode}');
  }
}
