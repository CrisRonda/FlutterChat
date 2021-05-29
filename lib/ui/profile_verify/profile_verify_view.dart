// import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/common/avatar_image/avatar_image_view.dart';
import 'package:chat_app/ui/home/home_view.dart';
import 'package:chat_app/ui/profile_verify/profile_verify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileVerifiyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileVerifyCubit(context.read(), context.read()),
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
                Text(
                  "Verifiy your identity",
                  style: Theme.of(context).textTheme.headline1.merge(
                      TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
                ),
                if (snap.file != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Image.file(
                      snap.file,
                      height: 200,
                    ),
                  )
                else
                  AvatarImageView(
                    child: Icon(
                      Icons.person_outline,
                      size: 100,
                      color: Colors.grey[400],
                    ),
                    onTap: () => context.read<ProfileVerifyCubit>().pickImage(),
                  ),
                Text(
                  "Your name",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 0, bottom: 50),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    style: Theme.of(context).textTheme.bodyText1.merge(
                        TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColorDark)),
                    controller:
                        context.read<ProfileVerifyCubit>().nameController,
                    decoration: InputDecoration(
                      hintText: "Or just how people now you",
                      hintStyle: Theme.of(context).textTheme.bodyText1.merge(
                          TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Theme.of(context).accentColor,
                    child: InkWell(
                        onTap: () =>
                            context.read<ProfileVerifyCubit>().startChating(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Text(
                            "Start chat now",
                            style: Theme.of(context).textTheme.button,
                          ),
                        )))
              ],
            ),
          ));
        },
      ),
    );
  }
}
