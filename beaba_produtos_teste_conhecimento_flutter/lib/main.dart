import 'package:beaba_produtos_teste_conhecimento_flutter/components/form_cadastro.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/provider/provider_funcionarios.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/routes/rotas.dart';
import 'package:beaba_produtos_teste_conhecimento_flutter/views/view_principal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FuncionariosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ViewPrincipal(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt')],
      ),
    ),
  );
}
