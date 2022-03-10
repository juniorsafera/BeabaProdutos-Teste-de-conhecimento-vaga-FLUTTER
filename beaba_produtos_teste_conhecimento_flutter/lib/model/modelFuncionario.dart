// ignore_for_file: file_names

class ModelFuncionario {
  final String id;
  final String nome;
  final String cargo;
  final String setor;
  final DateTime dataNascimento;
  final DateTime dataContratacao;
  bool demitido;

  DateTime? dataDemissao;

  ModelFuncionario({
    required this.id,
    required this.nome,
    required this.cargo,
    required this.setor,
    required this.dataNascimento,
    required this.dataContratacao,
    this.demitido = false,
    this.dataDemissao,
  });
}
