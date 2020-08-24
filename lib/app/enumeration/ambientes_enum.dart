enum Ambientes {
  SALA,
  COZINHA,
  AREA_SERVICO,
  QUARTO,
  SUITES,
  BANHEIROS,
  VARANDA,
  CHURRASQUEIRA,
  CORREDOR
}

extension ParseToString on Ambientes {
  String toShortString() {
    var caps = this.toString().split('.').last;
    return "${caps[0]}${caps.substring(1).toLowerCase()}";
  }
}
