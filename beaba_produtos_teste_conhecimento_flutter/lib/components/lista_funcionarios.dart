import 'package:beaba_produtos_teste_conhecimento_flutter/components/form_cadastro.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/components/form_funcionario.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/model/modelFuncionario.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/provider/provider_funcionarios.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/routes/rotas.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListaFuncionarios extends StatelessWidget {
  final List<ModelFuncionario> funcionarios;
  const ListaFuncionarios({Key? key, required this.funcionarios})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerFuncionarios = Provider.of<FuncionariosProvider>(context);
    return ListView.builder(
      itemCount: funcionarios.length,
      itemBuilder: (context, index) {
        final _funcionario = funcionarios[index];
        return Card(
          child: ListTile(
              title: Text(_funcionario.nome),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contratado: ${_funcionario.dataContratacao}'),
                  Text('Cargo: ${_funcionario.cargo}'),
                  Text('Setor: ${_funcionario.setor}'),
                  Text('Nascimento: ${DateFormat('dd/MM/y').format(_funcionario.dataNascimento)}'),
                  _funcionario.dataDemissao == null
                      ? const Text('')
                      : Text('Demitido: ${_funcionario.dataDemissao}'),
                ],
              ),
              trailing: SizedBox(
                width: 80,
                height: 30,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormFuncionario(
                                    funcionario: funcionarios[index],
                                  )),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Deseja remover ${_funcionario.nome}?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                providerFuncionarios.remover(_funcionario);
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
