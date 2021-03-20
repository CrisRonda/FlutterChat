import 'package:chat_app/domain/exceptions/auth_exception.dart';
import 'package:chat_app/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashState { none, existing_user, new_user }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._loginUsecase) : super(SplashState.none);
  final LoginUsecase _loginUsecase;
  void init() async {
    try {
      final result = await _loginUsecase.validateLogin();
      emit(SplashState.existing_user);
    } on AuthException catch (ex) {
      if (ex.error == AuthErrorCode.not_auth) {
        emit(SplashState.none);
      } else {
        emit(SplashState.new_user);
      }
    }
    // await Future.delayed(const Duration(seconds: 1));
  }
}
