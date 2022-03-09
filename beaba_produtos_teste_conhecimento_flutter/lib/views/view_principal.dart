import 'package:beaba_produtos_teste_conhecimento_flutter/components/form_cadastro.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/components/lista_funcionarios.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/model/modelFuncionario.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/provider/provider_funcionarios.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/routes/rotas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewPrincipal extends StatefulWidget {
  const ViewPrincipal({Key? key}) : super(key: key);

  @override
  State<ViewPrincipal> createState() => _ViewPrincipalState();
}

class _ViewPrincipalState extends State<ViewPrincipal> {
  @override
  Widget build(BuildContext context) {
    final providerFuncionarios = Provider.of<FuncionariosProvider>(context);
    final List<ModelFuncionario> listaFuncionarios =
        providerFuncionarios.funcionariosCadastrados;

    final size = MediaQuery.of(context).size;
 
   

    return Scaffold(
        appBar: AppBar(
          title: const Text('Funcionários'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Rotas.formCadastro);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: ListaFuncionarios(
          funcionarios: listaFuncionarios,
        ));
  }
}
