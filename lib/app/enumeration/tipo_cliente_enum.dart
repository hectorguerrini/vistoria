enum TipoCliente { LOCADOR, LOCATARIO, FIADOR }

extension ParseToString on TipoCliente {
  String toShortString() {
    var caps = this.toString().split('.').last;
    return "${caps[0]}${caps.substring(1).toLowerCase()}";
  }
}
