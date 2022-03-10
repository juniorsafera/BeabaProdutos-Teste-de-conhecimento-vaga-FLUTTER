// ignore_for_file: unnecessary_null_comparison

import 'dart:math';

import 'package:beaba_produtos_teste_conhecimento_flutter/data/dados.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/model/modelFuncionario.dart';

import 'package:flutter/cupertino.dart';

class FuncionariosProvider with ChangeNotifier {
  final Map<String, ModelFuncionario> _funcionarios = {...listaFuncionarios};

  List<ModelFuncionario> get funcionariosCadastrados =>
      [..._funcionarios.values];

  int get count {
    return _funcionarios.length;
  }

  void cadastrar(ModelFuncionario funcionario) {
    // ADICIONAR UM NOVO FUNCIONARIO NO BANCO
    final id = Random().nextDouble().toString();
    _funcionarios.putIfAbsent(
      id,
      () => ModelFuncionario(
        id: id,
        nome: funcionario.nome,
        cargo: funcionario.cargo,
        setor: funcionario.setor,
        dataNascimento: funcionario.dataNascimento,
        dataContratacao: DateTime.now(),
        demitido: false,
      ),
    );

    notifyListeners();
  }

  void remover(ModelFuncionario funcionario) {
    // REMOVER FUNCIONARIO DO BANCO
    if (funcionario != null && funcionario.id != null) {
      _funcionarios.remove(funcionario.id);
      notifyListeners();
    }
  }

  void alterar(ModelFuncionario funcionario) {
    // ATERAR DADOS DE FUNCIONARIO
    _funcionarios.update(
      funcionario.id,
      (_) => ModelFuncionario(
        id: funcionario.id,
        nome: funcionario.nome,
        cargo: funcionario.cargo,
        setor: funcionario.setor,
        dataNascimento: funcionario.dataNascimento,
        dataContratacao: funcionario.dataContratacao,
        demitido: funcionario.demitido,
        dataDemissao: funcionario.dataDemissao,
      ),
    );
    notifyListeners();
  }
}
