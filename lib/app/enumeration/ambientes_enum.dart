enum Ambientes {
  SALA,
  COZINHA,
  AREA_SERVICO,
  QUARTOS,
  SUITES,
  BANHEIROS,
  VARANDA,
  CHURRASQUEIRA,
  CORREDOR
}

extension ParseToString on Ambientes {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
