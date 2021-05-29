import 'package:chat_app/domain/usecases/login_usecase.dart';
import 'package:chat_app/ui/profile_verify/profile_verify_view.dart';
import 'package:chat_app/ui/home/home_view.dart';
import 'package:chat_app/ui/sign_in/sign_in_view.dart';
import 'package:chat_app/ui/splash/initial_background_view.dart';
import 'package:chat_app/ui/splash/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/navigator_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context.read<LoginUsecase>())..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, snap) {
          switch (snap) {
            case SplashState.new_user:
              pushAndReplacePage(context, ProfileVerifiyView());
              break;
            case SplashState.existing_user:
              pushAndReplacePage(context, HomeView());
              break;
            default:
              pushAndReplacePage(context, SignInView());
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              InitialBackgroundView(),
              Center(
                child: Hero(
                  tag: 'login-hero',
                  child: Image.asset(
                    'assets/logo.png',
                    height: 150,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
