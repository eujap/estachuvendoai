import 'package:flutter/material.dart';
import 'package:esta_chuvendo_ai/controllers/tema_controller.dart';
import 'package:esta_chuvendo_ai/widgets/home.dart';

class EstaChovendoAiApp extends StatelessWidget {
  const EstaChovendoAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: TemaController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Está chovendo aí?',
          theme: TemaController.instance.usarTemaEscuro
              ? ThemeData.dark()
              : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: const Home(),
        );
      },
    );
  }
}
