import 'package:flutter_bloc/flutter_bloc.dart';

enum SignInState {
  none,
  existing_user,
}

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState.none);

  void signWithFirebase() async {
    // Validate user
    await Future.delayed(const Duration(seconds: 1));
    emit(SignInState.none);
  }
}
