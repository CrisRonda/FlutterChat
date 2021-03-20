import 'package:chat_app/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SignInState {
  none,
  existing_user,
}

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._loginUsecase) : super(SignInState.none);
  final LoginUsecase _loginUsecase;

  void signWithFirebase() async {
    try {
      final result = await _loginUsecase.validateLogin();
      if (result) {
        emit(SignInState.existing_user);
      }
    } catch (e) {
      final result = await _loginUsecase.signIn();
      if (result != null) {
        emit(SignInState.none);
      }
    }
  }
}
