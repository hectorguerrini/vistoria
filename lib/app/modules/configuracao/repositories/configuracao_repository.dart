import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vistoria/app/modules/configuracao/models/corretor_model.dart';
import 'package:vistoria/app/shared/auth/auth_controller.dart';

class ConfiguracaoRepository {
  // final CollectionReference _corretorCollection =
  //     FirebaseFirestore.instance.collection('corretores');
  final AuthController _authController = Modular.get();
  // Future saveCorretor(CorretorModel corretorModel) async {
  //   await _corretorCollection
  //       .doc(_authController.user.uid)
  //       .set(corretorModel.toJson());
  // }
  Future saveName(String displayName) async {
    return await _authController.updateDisplayName(displayName);
  }
}
