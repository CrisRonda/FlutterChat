import 'package:chat_app/ui/home/home_view.dart';
import 'package:chat_app/ui/profile_verify/profile_verify_view.dart';
import 'package:chat_app/ui/sign_in/sign_in_cubit.dart';
import 'package:chat_app/ui/splash/initial_background_view.dart';
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
              body: Stack(children: [
            InitialBackgroundView(),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Column(
                children: [
                  Spacer(),
                  Hero(
                    tag: 'login-hero',
                    child: Image.asset(
                      'assets/logo.png',
                      height: 150,
                    ),
                  ),
                  Text(
                    "Welcome to\nDev's Chat",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text("A plattaform to chat with other devs",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .merge(TextStyle(fontSize: 12))),
                  Spacer(),
                  Material(
                    elevation: 2,
                    shadowColor: Colors.black45,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    color: Colors.white38,
                    child: InkWell(
                      onTap: () {
                        context.read<SignInCubit>().signWithFirebase();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/google_icon.png',
                              height: 24,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Login with Google',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .merge(
                                      TextStyle(fontWeight: FontWeight.w800)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8, bottom: 32, right: 8, top: 8),
                        child: Text(
                            "This is part of portfolio\nabout Cristian Ronda"),
                      ))
                ],
              ),
            ),
          ]));
        },
      ),
    );
  }
}
