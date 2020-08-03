enum ItensAmbiente {
  PAREDE,
  PISO,
  TETO,
  LUMINARIAS,
  TOMADAS_E_INTERRUPTORES,
  AR_CONDICIONADO,
  PORTA,
  TORNEIRA,
  ARMARIO
}

extension ParseToString on ItensAmbiente {
  String toShortString() {
    return this.toString().split('.').last.replaceAll('_', ' ');
  }
}
