class PrevisaoHora {
  final String horario;
  final String descricao;
  final int numeroIcone;
  final double temperatura;

  PrevisaoHora(
    this.horario,
    this.descricao,
    this.numeroIcone,
    this.temperatura,
  );

  factory PrevisaoHora.transformarJSON(Map<String, dynamic> objetoJson) {
    return PrevisaoHora(
        PrevisaoHora.transformarHorario(objetoJson['DateTime']),
        objetoJson['IconPhrase'],
        objetoJson['WeatherIcon'],
        objetoJson['Temperature']['Value']);
  }

  static String transformarHorario(String horario) {
    return horario != null ? horario.split('T')[1].substring(0, 5) : '';
  }
}
