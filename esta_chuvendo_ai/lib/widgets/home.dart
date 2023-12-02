import 'package:esta_chuvendo_ai/models/previsao_hora.dart';
import 'package:esta_chuvendo_ai/services/previsao_service.dart';
import 'package:esta_chuvendo_ai/widgets/proximas_temperaturas.dart';
import 'package:esta_chuvendo_ai/widgets/resumo.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<PrevisaoHora>> ultimasPrevisoes;

  @override
  void initState() {
    super.initState();
    carregarPrevisoes();
  }

  void carregarPrevisoes() {
    PrevisaoService service = PrevisaoService();
    ultimasPrevisoes = service.recuperarUltimasPrevisoes();
  }

  Future<Null> atualizarPrevisoes() async {
    setState(() => carregarPrevisoes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
        child: FutureBuilder<List<PrevisaoHora>>(
          future: ultimasPrevisoes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PrevisaoHora> previsoes =
                  snapshot.data as List<PrevisaoHora>;
              double temperaturaAtual = previsoes[0].temperatura;
              double menorTemperatura = double.maxFinite;
              double maiorTemperatura = double.negativeInfinity;
              previsoes.forEach((obj) {
                if (obj.temperatura < menorTemperatura) {
                  menorTemperatura = obj.temperatura;
                }
                if (obj.temperatura > maiorTemperatura) {
                  maiorTemperatura = obj.temperatura;
                }
              });
              String descricao = previsoes[0].descricao;
              int numeroIcone = previsoes[0].numeroIcone;

              return Column(
                children: [
                  Resumo(
                      cidade: 'sinop-mt',
                      temperaturaAtual: temperaturaAtual,
                      temperaturaMaxima: maiorTemperatura,
                      temperaturaMinima: menorTemperatura,
                      numeroIcone: numeroIcone,
                      descricao: descricao),
                  Padding(padding: EdgeInsets.all(10)),
                  ProximasTemperaturas(
                    previsoes: previsoes.sublist(1, previsoes.length),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Erro ao carregar as previsoes');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
