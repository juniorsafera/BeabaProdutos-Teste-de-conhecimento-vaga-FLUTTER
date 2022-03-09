import 'package:beaba_produtos_teste_conhecimento_flutter/model/modelFuncionario.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormFuncionario extends StatefulWidget {
  final ModelFuncionario funcionario;
  const FormFuncionario({Key? key, required this.funcionario})
      : super(key: key);

  @override
  State<FormFuncionario> createState() => _FormFuncionarioState();
}

DateTime? _dataSelecionada;
bool _demotido = true;

final TextEditingController cNome = TextEditingController();
final TextEditingController cCargo = TextEditingController();
final TextEditingController cSetor = TextEditingController();

class _FormFuncionarioState extends State<FormFuncionario> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _demotido = widget.funcionario.demitido;
    _dataSelecionada = widget.funcionario.dataNascimento;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.funcionario.nome),
      ),
      body: Container(
        // ignore: prefer_const_literals_to_create_immutables
        padding: const EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: cNome,
                //initialValue: widget.funcionario.nome,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Nome Completo'),
              ),
              TextFormField(
                controller: cCargo,
                //initialValue: widget.funcionario.cargo,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Cargo'),
              ),
              TextFormField(
                controller: cSetor,
                //initialValue: widget.funcionario.setor,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(labelText: 'Setor'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FlatButton(
                      onPressed: () {
                        //   _abrirCalendario();
                      },
                      child: const Text('Data Nascimento: '),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    _dataSelecionada == null
                        ? const Text('')
                        : Text(
                            DateFormat('dd/MM/y').format(_dataSelecionada!),
                          ),
                  ],
                ),
              ),
              Row(
                children: [
                  const Text('Demitir'),
                  Switch(
                      value: _demotido,
                      onChanged: (bool v) {
                        setState(() {
                          _demotido = v;
                        });
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: const Text('Salvar'),
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
