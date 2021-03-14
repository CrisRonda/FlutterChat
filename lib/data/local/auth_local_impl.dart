import 'package:chat_app/data/auth_repository.dart';
import 'package:chat_app/domain/models/auth_user.dart';

class AuthLocalImpl extends AuthRepository {
  @override
  Future<AuthUser> getAuthUser() async {
    await Future.delayed(Duration(seconds: 1));
    return AuthUser("initgrammers");
  }

  @override
  Future<void> logout() async {
    return;
  }

  @override
  Future<AuthUser> signIn() async {
    await Future.delayed(Duration(seconds: 1));
    return AuthUser("initgrammers");
  }
}
