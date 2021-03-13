// import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/home/home_view.dart';
import 'package:chat_app/ui/profile_verify/profile_verify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileVerifiyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileVerifyCubit(),
      child: BlocConsumer<ProfileVerifyCubit, ProfileState>(
        listener: (context, snap) {
          if (snap.success) {
            pushAndReplacePage(context, HomeView());
          }
        },
        builder: (context, snap) {
          return Scaffold(
              body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Verifiy your identity"),
                Placeholder(
                  fallbackHeight: 100,
                  fallbackWidth: 100,
                ),
                IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () =>
                        context.read<ProfileVerifyCubit>().pickImage()),
                Text("Your name"),
                TextField(
                  decoration:
                      InputDecoration(hintText: "Or just how people now you"),
                ),
                ElevatedButton(
                    onPressed: () =>
                        context.read<ProfileVerifyCubit>().startChating(),
                    child: Text("Start chat now"))
              ],
            ),
          ));
        },
      ),
    );
  }
}
