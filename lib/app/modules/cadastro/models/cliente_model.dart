class ClienteModel {
  final String nomeCompleto;
  final String email;
  final String celular;
  final String telefone;
  final bool isWhatsapp;
  final String cpf;
  final String rg;
  final DateTime dtNascimento;

  ClienteModel(
      {this.nomeCompleto,
      this.email,
      this.celular,
      this.telefone,
      this.isWhatsapp,
      this.cpf,
      this.rg,
      this.dtNascimento});

  copyWith(
      {String nomeCompleto,
      String email,
      String celular,
      String telefone,
      bool isWhatsapp,
      String cpf,
      String rg,
      DateTime dtNascimento}) {
    return ClienteModel(
      nomeCompleto: nomeCompleto ?? this.nomeCompleto,
      email: email ?? this.email,
      celular: celular ?? this.celular,
      telefone: telefone ?? this.telefone,
      isWhatsapp: isWhatsapp ?? this.isWhatsapp,
      cpf: cpf ?? this.cpf,
      rg: rg ?? this.rg,
      dtNascimento: dtNascimento ?? this.dtNascimento,
    );
  }
}
