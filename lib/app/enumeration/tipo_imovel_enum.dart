enum TipoImovel { CASA, APARTAMENTO, SALA, GALPAO }

extension ParseToString on TipoImovel {
  String toShortString() {
    var caps = this.toString().split('.').last;
    return "${caps[0]}${caps.substring(1).toLowerCase()}";
  }
}
