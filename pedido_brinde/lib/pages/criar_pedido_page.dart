import 'package:flutter/services.dart';
import 'package:pedido_brinde/dao/criar_pedido_dao.dart';
import 'package:pedido_brinde/models/Cliente.dart';
import 'package:pedido_brinde/dao/listar_localidades_dao.dart';
import 'package:flutter/material.dart';
import 'package:pedido_brinde/models/Localidade.dart';
import 'package:logger/logger.dart';

class CriarPedidoPage extends StatefulWidget {
  @override
  _CriarPedidoPageState createState() => _CriarPedidoPageState();
}

class _CriarPedidoPageState extends State<CriarPedidoPage> {
  Cliente cliente = Cliente();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Cliente?;
    if (args != null) {
      setState(() {
        cliente = args;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      carregarLocalidades(cliente.filial.toString(), '0');
    });
  }

  Localidade? localidadeSelecionada;
  String? formaPagamento;
  List<Localidade> localidades = [];
  bool carregando = true;
  var logger = Logger();

  Future<void> carregarLocalidades(String? codFilial, String? codPerfil) async {
    try {
      final resultado = await listarLocalidades(
        codigo: cliente.codCliente,
        filial: codFilial,
        perfil: codPerfil,
      );
      setState(() {
        localidades = List<Localidade>.from(resultado);
        carregando = false;
      });
    } catch (e) {
      print('Erro ao carregar localidades: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao carregar localidades')));
      setState(() {
        carregando = false;
      });
    }
  }

  Future<bool> criarPedidoVenda(
    Map<String, dynamic> jsonDados,
    List<Map<String, dynamic>> jsonListaItens,
  ) async {
    try {
      final resposta = await criarPedido(
        cliente.filial as String,
        jsonDados,
        jsonListaItens,
      );
      setState(() {
        carregando = false;
      });
      return resposta;
    } catch (e) {
      setState(() {
        carregando = false;
      });
      throw ("Erro ao inserir pedido: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade200, Colors.deepOrange.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: carregando
              ? Center(child: CircularProgressIndicator(color: Colors.white))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nome e faixa
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cliente: ${cliente.nome} (Código: ${cliente.codCliente})',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            height: 4,
                            width: double.infinity,
                            color: Colors.white,
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      Text(
                        'Quantidade de itens:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      SizedBox(height: 24),

                      Text(
                        'Localidade do cliente:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<Localidade>(
                        isExpanded: true,
                        value: localidadeSelecionada,
                        items: localidades.map((localidade) {
                          return DropdownMenuItem<Localidade>(
                            value: localidade,
                            child: Text(
                              localidade.nomeLocalidade,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 14),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            localidadeSelecionada = value;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      SizedBox(height: 24),

                      Text(
                        'Forma de pagamento:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            RadioListTile<String>(
                              title: Text('À vista'),
                              value: 'V',
                              groupValue: formaPagamento,
                              onChanged: (value) =>
                                  setState(() => formaPagamento = value),
                            ),
                            RadioListTile<String>(
                              title: Text('A prazo'),
                              value: 'P',
                              groupValue: formaPagamento,
                              onChanged: (value) =>
                                  setState(() => formaPagamento = value),
                            ),
                          ],
                        ),
                      ),

                      Spacer(),

                      Center(
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.check),
                          label: Text('Finalizar Pedido'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            if (localidadeSelecionada != null &&
                                formaPagamento != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Pedido finalizado com sucesso!',
                                  ),
                                ),
                              );

                              Map<String, dynamic> jsonDados = {
                                "CodCliente": cliente.codCliente,
                                "CodLocalidade":
                                    localidadeSelecionada!.codLocalidade,
                                "VistaPrazo": formaPagamento,
                              };

                              final List<Map<String, dynamic>> jsonListaItens =
                                  [];

                              if (await criarPedidoVenda(
                                jsonDados,
                                jsonListaItens,
                              )) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Pedido Criado')),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Selecione localidade e forma de pagamento',
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
