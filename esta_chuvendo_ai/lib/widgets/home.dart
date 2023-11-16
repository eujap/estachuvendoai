import 'package:esta_chuvendo_ai/models/previsao_hora.dart';
import 'package:esta_chuvendo_ai/services/previsao_service.dart';
import 'package:esta_chuvendo_ai/widgets/proximas_temperaturas.dart';
import 'package:esta_chuvendo_ai/widgets/resumo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<PrevisaoHora> ultimasPrevisoes;

  @override
  void initState() {
    super.initState();
    PrevisaoService service = PrevisaoService();
    ultimasPrevisoes = service.recuperarUltimasPrevisoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Está Chovendo! Aí?',
          style: TextStyle(
            fontFamily: 'SouceCodePro',
            fontStyle: FontStyle.italic,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Resumo(
              cidade: 'sinop-mt',
              temperaturaAtual: 30,
              temperaturaMaxima: 40,
              temperaturaMinima: 30,
              numeroIcone: 3,
              descricao: 'ta de boa',
            ),
            Padding(padding: EdgeInsets.all(10)),
            ProximasTemperaturas(
              previsoes: ultimasPrevisoes,
            ),
          ],
        ),
      ),
    );
  }
}
