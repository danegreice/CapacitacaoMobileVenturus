import 'package:flutter/material.dart';
import 'package:pedido_brinde/models/Cliente.dart';
import 'package:pedido_brinde/dao/buscar_cliente_dao.dart';
import 'package:logger/logger.dart';

class PesquisarClientePage extends StatefulWidget {
  @override
  _PesquisarClientePageState createState() => _PesquisarClientePageState();
}

class _PesquisarClientePageState extends State<PesquisarClientePage> {
  final Map<int, String> filiais = {
    1: 'AM',
    2: 'RO',
    3: 'AC',
    6: 'RR',
    9: 'ST',
    10: 'VS',
    11: 'JT',
  };
  var logger = Logger();
  List<Cliente> clientes = [];
  String query = '';
  bool loading = false;

  Future<void> buscar() async {
    setState(() => loading = true);
    try {
      final isCodigo = int.tryParse(query) != null;

      final resultado = await buscarClientes(
        nome: isCodigo ? null : query,
        codigo: isCodigo ? query : null,
      );

      setState(() => clientes = resultado);
    } catch (e) {
      logger.e('Erro ao buscar clientes: $e');
    }
    setState(() => loading = false);
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar por nome ou código',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() => query = value);
                    if (value.length >= 2) {
                      buscar();
                    } else {
                      clientes.clear();
                    }
                  },
                ),
              ),
              if (loading)
                Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              if (!loading)
                Expanded(
                  child: clientes.isEmpty
                      ? Center(
                          child: Text(
                            'Nenhum cliente encontrado',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          itemCount: clientes.length,
                          itemBuilder: (context, index) {
                            final cliente = clientes[index];
                            return Card(
                              child: ListTile(
                                title: Text(
                                  cliente.nome ?? '-',
                                  style: TextStyle(color: Colors.deepOrange),
                                ),
                                subtitle: Text(
                                  'Código: ${cliente.codCliente}',
                                  style: TextStyle(color: Colors.orangeAccent),
                                ),
                                trailing: Text(
                                  'Base: ${filiais[cliente.filial]}',
                                  style: TextStyle(color: Colors.orangeAccent),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/criar_pedido',
                                    arguments: cliente,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Voltar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
