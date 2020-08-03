enum EstadoItens { NOVO, BOM, REGULAR, MAU }

extension ParseToString on EstadoItens {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
