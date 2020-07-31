enum TipoImovel { CASA, APARTAMENTO, SALA, GALPAO }

extension ParseToString on TipoImovel {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
