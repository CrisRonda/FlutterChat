import 'package:chat_app/ui/home/home_view.dart';
import 'package:chat_app/ui/profile_verify/profile_verify_view.dart';
import 'package:chat_app/ui/sign_in/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/navigator_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(context.read()),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, snap) {
          print("#####SNAP#####");
          print(snap);
          print("##########");
          switch (snap) {
            case SignInState.existing_user:
              pushAndReplacePage(context, HomeView());
              break;
            default:
              pushAndReplacePage(context, ProfileVerifiyView());
          }
        },
        builder: (context, snap) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome to Chat"),
                  ElevatedButton(
                      onPressed: () {
                        context.read<SignInCubit>().signWithFirebase();
                      },
                      child: Text("Login with Google..."))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
