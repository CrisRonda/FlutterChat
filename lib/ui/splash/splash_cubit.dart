import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashState { none, existing_user, new_user }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.none);

  void init() async {
    // Validate user
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashState.none);
  }
}
