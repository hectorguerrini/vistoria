enum TipoVistoria { ENTRADA, SAIDA }

extension ParseToString on TipoVistoria {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
