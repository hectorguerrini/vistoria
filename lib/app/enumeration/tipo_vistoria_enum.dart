enum TipoVistoria { ENTRADA, SAIDA }

extension ParseToString on TipoVistoria {
  String toShortString() {
    var caps = this.toString().split('.').last;
    return "${caps[0]}${caps.substring(1).toLowerCase()}";
  }
}
