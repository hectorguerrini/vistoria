enum StatusVistoria { RASCUNHO, FINALIZADO }

extension ParseToString on StatusVistoria {
  String toShortString() {
    return this.toString().split('.').last.replaceAll('_', ' ');
  }
}
