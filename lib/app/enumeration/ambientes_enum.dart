enum Ambientes {
  AREA_SERVICO,
  BANHEIROS,
  CHURRASQUEIRA,
  CORREDOR,
  COZINHA,
  EDICULA,
  GARAGEM,
  QUARTO,
  QUINTAL,
  SALA,
  SUITES,
  VARANDA,
}

extension ParseToString on Ambientes {
  String toShortString() {
    var caps = this.toString().split('.').last;
    return "${caps[0]}${caps.substring(1).toLowerCase()}";
  }
}
