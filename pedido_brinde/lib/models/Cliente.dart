class Cliente {
  final int? filial;
  final String? codCliente;
  final String? nome;
  final int? orgaoFederal;
  final int? prazoMaximo;
  final String? faixaGranel;
  final int? codEstoqueExterno;
  final int? codLocalidade;
  final int? lAnterior;
  final String? codCidade;
  final String? cpfCnpj;
  final double? limiteClasseKg;

  Cliente({
    this.filial,
    this.codCliente,
    this.nome,
    this.orgaoFederal,
    this.prazoMaximo,
    this.faixaGranel,
    this.codEstoqueExterno,
    this.codLocalidade,
    this.lAnterior,
    this.codCidade,
    this.cpfCnpj,
    this.limiteClasseKg,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      filial: json['filial'] != null ? (json['filial'] as num).toInt() : null,
      codCliente: json['codigo']?.toString(),
      nome: json['nome']?.toString(),
      orgaoFederal: json['eorgaofederal'] != null
          ? (json['eorgaofederal'] as num).toInt()
          : null,
      prazoMaximo: json['prazomaximo'] != null
          ? (json['prazomaximo'] as num).toInt()
          : null,
      faixaGranel: json['faixagranel']?.toString(),
      codEstoqueExterno: json['codestoqueexterno'] != null
          ? (json['codestoqueexterno'] as num).toInt()
          : null,
      codLocalidade: json['codlocalidade'] != null
          ? (json['codlocalidade'] as num).toInt()
          : null,
      lAnterior: json['lanterior'] != null
          ? (json['lanterior'] as num).toInt()
          : null,
      codCidade: json['codcidade']?.toString(),
      cpfCnpj: json['CPFCGC']?.toString(),
      limiteClasseKg: json['limiteclassekg'] != null
          ? (json['limiteclassekg'] as num).toDouble()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'filial': filial,
      'codigo': codCliente,
      'nome': nome,
      'eorgaofederal': orgaoFederal,
      'prazomaximo': prazoMaximo,
      'faixagranel': faixaGranel,
      'codestoqueexterno': codEstoqueExterno,
      'codlocalidade': codLocalidade,
      'lanterior': lAnterior,
      'codcidade': codCidade,
      'CPFCGC': cpfCnpj,
      'limiteclassekg': limiteClasseKg,
    };
  }
}
