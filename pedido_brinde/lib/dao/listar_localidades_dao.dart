import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:pedido_brinde/utils/constants.dart';
import 'package:pedido_brinde/models/Localidade.dart';

Future<List<Localidade>> listarLocalidades({
  String? codigo,
  String? filial,
  String? perfil,
}) async {
  var logger = Logger();
  final queryParams = <String, String>{};

  if (codigo != null && codigo.isNotEmpty) queryParams['codigo'] = codigo;
  if (filial != null && filial.isNotEmpty) queryParams['filial'] = filial;
  if (perfil != null && perfil.isNotEmpty) queryParams['perfil'] = perfil;

  final uri = Uri.parse(
    '${AppRoutes.URL_BASE}/localidades',
  ).replace(queryParameters: queryParams);
  logger.i('uri: $uri');
  final response = await http.get(uri);
  logger.i('response body: ${response.body}');
  logger.i('response status: ${response.statusCode}');

  if (response.statusCode == 200) {
    final List json = jsonDecode(response.body);
    return json.map((item) => Localidade.fromJson(item)).toList();
  } else {
    throw Exception('Erro ao buscar localidades');
  }
}
