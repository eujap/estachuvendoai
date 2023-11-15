import 'package:esta_chuvendo_ai/widgets/home.dart';
import 'package:flutter/material.dart';

class EstaChovendoAiApp extends StatelessWidget {
  const EstaChovendoAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Está Chovendo Aí?',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
