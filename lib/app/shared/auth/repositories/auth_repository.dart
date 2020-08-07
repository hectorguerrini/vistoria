import 'package:firebase_auth/firebase_auth.dart';
import 'package:vistoria/app/shared/auth/repositories/auth_reposiroty_interface.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> loginWithEmailAndPassword(
      String email, String senha) async {
    return (await _auth.signInWithEmailAndPassword(
            email: email, password: senha))
        .user;
  }

  @override
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }
}
