// ignore_for_file: prefer_const_constructors

import 'package:esta_chuvendo_ai/models/previsao_hora.dart';
import 'package:flutter/material.dart';

class ProximasTemperaturas extends StatelessWidget {
  final List<PrevisaoHora> previsoes;

  const ProximasTemperaturas({
    Key? key,
    required this.previsoes,
  }) : super(key: key);

  Card criarCardPrevisao(int i) {
    return Card(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(
              'images/${previsoes[i].numeroIcone < 10 ? 0 : ''}${previsoes[i].numeroIcone}-s.png'),
        ),
        Padding(padding: EdgeInsets.all(2)),
        Text(previsoes[i].horario),
        Padding(padding: EdgeInsets.all(5)),
        Text('${previsoes[i].temperatura.toStringAsFixed(0)}ºC'),
        Padding(padding: EdgeInsets.all(5)),
        Text(previsoes[i].descricao),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: previsoes.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return criarCardPrevisao(i);
        },
      ),
    );
  }
}
