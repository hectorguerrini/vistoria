enum TipoCliente { LOCADOR, LOCATARIO, FIADOR }

extension ParseToString on TipoCliente {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
