import 'package:beaba_produtos_teste_conhecimento_flutter/components/form_cadastro.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/components/lista_funcionarios.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/model/modelFuncionario.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/provider/provider_funcionarios.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionários'),
        centerTitle: true,
        actions: [
          // BOTAO PARA CHAMAR A TELA DE CADASTRO
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormCadastro()),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child:
            // ABAIXO SE A LISTA DE FUNCIONARIOS ESTIVER VAZIA NOTIFICAR,
            // CASO CONTRARIO EXIBIR A LISTA DE FUNCIONARIOS
            listaFuncionarios.isEmpty
                ? const Center(
                    child: Text('Nenhum funcionário cadastrado!'),
                  )
                : ListaFuncionarios(
                    funcionarios: listaFuncionarios,
                  ),
      ),
    );
  }
}
