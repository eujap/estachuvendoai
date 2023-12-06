import 'package:esta_chuvendo_ai/controllers/tema_controller.dart';
import 'package:flutter/material.dart';

class Resumo extends StatefulWidget {
  final String cidade;
  final String descricao;
  final double temperaturaAtual;
  final double temperaturaMaxima;
  final double temperaturaMinima;
  final int numeroIcone;

  const Resumo(
      {super.key,
      required this.cidade,
      required this.descricao,
      required this.temperaturaAtual,
      required this.temperaturaMaxima,
      required this.temperaturaMinima,
      required this.numeroIcone});

  @override
  State<Resumo> createState() => _ResumoState();
}

class _ResumoState extends State<Resumo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                const Icon(Icons.brightness_6_outlined),
                Switch(
                  value: TemaController.instance.usarTemaEscuro,
                  onChanged: (valor) {
                    TemaController.instance.trocarTema();
                  },
                )
              ],
            )
          ],
        ),
        Text(
          widget.cidade,
          style: const TextStyle(fontSize: 18),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage(
                      'images/${widget.numeroIcone < 10 ? 0 : ''}${widget.numeroIcone}-s.png')),
              const Padding(padding: EdgeInsets.all(2)),
              Text(
                '${widget.temperaturaAtual.toStringAsFixed(0)} ºC',
                style: const TextStyle(fontSize: 40),
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${widget.temperaturaMaxima.toStringAsFixed(0)} ºC'),
                  Text('${widget.temperaturaMinima.toStringAsFixed(0)} ºC'),
                ],
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Text(
          widget.descricao,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
