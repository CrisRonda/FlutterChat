import 'package:chat_app/data/auth_repository.dart';
import 'package:chat_app/data/stream_api_repository.dart';
import 'package:chat_app/domain/exceptions/auth_exception.dart';

class LoginUsecase {
  LoginUsecase(this._authRepository, this._streamApiRepository);
  final AuthRepository _authRepository;
  final StreamApiRepository _streamApiRepository;

  Future<bool> validateLogin() async {
    final user = await _authRepository.getAuthUser();
    if (user != null) {
      final result = await _streamApiRepository.connectIfExist(user.id);
      if (result)
        return true;
      else
        throw AuthException(AuthErrorCode.not_chat_user);
    }
    throw AuthException(AuthErrorCode.not_auth);
  }
}
