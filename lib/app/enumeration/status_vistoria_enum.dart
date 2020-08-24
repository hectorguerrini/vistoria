enum StatusVistoria { RASCUNHO, FINALIZADO }

extension ParseToString on StatusVistoria {
  String toShortString() {
    var caps = this.toString().split('.').last;
    return "${caps[0]}${caps.substring(1).toLowerCase()}";
  }
}
