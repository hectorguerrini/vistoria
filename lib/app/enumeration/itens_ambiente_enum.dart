enum ItensAmbiente {
  PAREDE,
  PISO,
  TETO,
  LUMINARIAS,
  TOMADAS_E_INTERRUPTORES,
  AR_CONDICIONADO,
  PORTA,
  JANELA,
  ARMARIO,
  PIA,
  BOX_E_CHUVEIRO,
  PRIVADA_E_BIDE,
}

extension ParseToString on ItensAmbiente {
  String toShortString() {
    var caps = this.toString().split('.').last.replaceAll('_', ' ');
    return "${caps[0]}${caps.substring(1).toLowerCase()}";
  }
}
