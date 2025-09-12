class Localidade {
  final int codLocalidade;
  final String nomeLocalidade;
  final String liberado;
  final int nPedido;

  Localidade({
    required this.codLocalidade,
    required this.nomeLocalidade,
    required this.liberado,
    required this.nPedido,
  });

  factory Localidade.fromJson(Map<String, dynamic> json) {
    return Localidade(
      codLocalidade: json['codlocalidade'],
      nomeLocalidade: json['nomelocalidade'],
      liberado: json['liberado'],
      nPedido: json['npedido'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codlocalidade': codLocalidade,
      'nomelocalidade': nomeLocalidade,
      'liberado': liberado,
      'npedido': nPedido,
    };
  }
}
