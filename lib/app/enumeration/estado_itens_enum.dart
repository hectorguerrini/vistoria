enum EstadoItens { NOVO, BOM, REGULAR, RUIM }

extension ParseToString on EstadoItens {
  String toShortString() {
    var caps = this.toString().split('.').last;
    return "${caps[0]}${caps.substring(1).toLowerCase()}";
  }
}
