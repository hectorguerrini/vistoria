// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfiguracaoController on _ConfiguracaoControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_ConfiguracaoControllerBase.isValid'))
      .value;

  final _$nomeCompletoAtom =
      Atom(name: '_ConfiguracaoControllerBase.nomeCompleto');

  @override
  String get nomeCompleto {
    _$nomeCompletoAtom.reportRead();
    return super.nomeCompleto;
  }

  @override
  set nomeCompleto(String value) {
    _$nomeCompletoAtom.reportWrite(value, super.nomeCompleto, () {
      super.nomeCompleto = value;
    });
  }

  final _$_ConfiguracaoControllerBaseActionController =
      ActionController(name: '_ConfiguracaoControllerBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_ConfiguracaoControllerBaseActionController
        .startAction(name: '_ConfiguracaoControllerBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_ConfiguracaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo = _$_ConfiguracaoControllerBaseActionController
        .startAction(name: '_ConfiguracaoControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_ConfiguracaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeCompleto: ${nomeCompleto},
isValid: ${isValid}
    ''';
  }
}
