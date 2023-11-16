import 'package:flutter/material.dart';

class TemaController extends ChangeNotifier {
  bool usarTemaEscuro = false;
  static TemaController instance = new TemaController();

  TemaController() {
    usarTemaEscuro = false;
  }

  trocarTema() {
    usarTemaEscuro = !usarTemaEscuro;
    notifyListeners();
  }
}
