import 'package:chat_app/data/auth_repository.dart';
import 'package:chat_app/data/stream_api_repository.dart';

class LogoutUsecase {
  LogoutUsecase(this._authRepository, this._streamApiRepository);
  final AuthRepository _authRepository;
  final StreamApiRepository _streamApiRepository;

  Future<void> logout() async {
    await _streamApiRepository.logout();
    await _authRepository.logout();
  }
}
