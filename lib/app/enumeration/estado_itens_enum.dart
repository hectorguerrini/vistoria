enum EstadoItens { NOVO, BOM, REGULAR, RUIM }

extension ParseToString on EstadoItens {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
