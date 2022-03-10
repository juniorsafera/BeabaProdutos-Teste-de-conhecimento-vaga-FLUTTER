// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:beaba_produtos_teste_conhecimento_flutter/model/modelFuncionario.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/provider/provider_funcionarios.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FormCadastro extends StatefulWidget {
  const FormCadastro({
    Key? key,
  }) : super(key: key);

  @override
  State<FormCadastro> createState() => _FormCadastroState();
}

DateTime? _dataSelecionada;
final TextEditingController cNome = TextEditingController();
final TextEditingController cCargo = TextEditingController();
final TextEditingController cSetor = TextEditingController();

// limpar campos ao cadastrar funcionário
void limpar() {
  cNome.clear();
  cCargo.clear();
  cSetor.clear();
  _dataSelecionada = null;
}

class _FormCadastroState extends State<FormCadastro> {
  @override
  Widget build(BuildContext context) {
    final providerFuncionarios = Provider.of<FuncionariosProvider>(context);

    // chamar calendário para selecionar data nascimetno
    _abrirCalendario() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime.now(),
      ).then((value) {
        if (value == null) {
          return;
        }
        setState(() {
          _dataSelecionada = value;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Funcionário'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_literals_to_create_immutables
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: cNome,
                // initialValue: _dadosForm['nome'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Nome Completo'),
              ),
              TextFormField(
                controller: cCargo,
                // initialValue: _dadosForm['cargo'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Cargo'),
              ),
              TextFormField(
                controller: cSetor,
                // initialValue: _dadosForm['setor'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Setor'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        _abrirCalendario();
                      },
                      child: Text('Data Nascimento: '),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    _dataSelecionada == null
                        ? Text('')
                        : Text(
                            DateFormat('dd/MM/y').format(_dataSelecionada!),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        // VALIDAR CAMPOS PARA NAO RECEBER DADOS NULOS
                        if (cNome.text.isEmpty ||
                            cCargo.text.isEmpty ||
                            cSetor.text.isEmpty ||
                            _dataSelecionada == null) {
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Atenção'),
                              content: const Text(
                                  'Preencha todos os dados corretamente!'),
                              actions: <Widget>[
                                // ignore: deprecated_member_use
                                FlatButton(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        } else {
                          providerFuncionarios.cadastrar(ModelFuncionario(
                            id: Random.secure().toString(),
                            nome: cNome.text,
                            cargo: cCargo.text,
                            setor: cSetor.text,
                            dataNascimento: _dataSelecionada!,
                            dataContratacao: DateTime.now(),
                          ));
                          limpar();
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Cadastrar'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
