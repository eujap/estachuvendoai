import 'package:esta_chuvendo_ai/controllers/tema_controller.dart';
import 'package:esta_chuvendo_ai/widgets/home.dart';
import 'package:flutter/material.dart';

class EstaChovendoAiApp extends StatelessWidget {
  const EstaChovendoAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: TemaController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Está Chovendo Aí?',
          theme: TemaController.instance.usarTemaEscuro
              ? ThemeData.dark()
              : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
      },
    );
  }
}
