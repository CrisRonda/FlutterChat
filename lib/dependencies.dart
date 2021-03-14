import 'package:chat_app/data/auth_repository.dart';
import 'package:chat_app/data/image_picker_repository.dart';
import 'package:chat_app/data/local/auth_local_impl.dart';
import 'package:chat_app/data/local/image_picker_local_impl.dart';
import 'package:chat_app/data/local/persisten_storage_local_impl.dart';
import 'package:chat_app/data/local/stream_api_local_impl.dart';
import 'package:chat_app/data/local/upload_storage_local_impl.dart';
import 'package:chat_app/data/persisten_storage_repository.dart';
import 'package:chat_app/data/stream_api_repository.dart';
import 'package:chat_app/data/upload_storage_repository.dart';
import 'package:chat_app/domain/usecases/create_group_usecase.dart';
import 'package:chat_app/domain/usecases/login_usecase.dart';
import 'package:chat_app/domain/usecases/logout_usecase.dart';
import 'package:chat_app/domain/usecases/profile_signin_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

List<RepositoryProvider> buildRepositories(StreamChatClient client) {
  return [
    RepositoryProvider<StreamApiRepository>(
        create: (_) => StreamApiLocalImpl(client)),
    RepositoryProvider<PersistentStorageRepository>(
        create: (_) => PersistenStorageLocalImpl()),
    RepositoryProvider<AuthRepository>(create: (_) => AuthLocalImpl()),
    RepositoryProvider<ImagePickerRepository>(
        create: (_) => ImagePickerLocalImpl()),
    RepositoryProvider<UploadStorageRepository>(
        create: (_) => UploadStorageLocalImpl()),
    RepositoryProvider<ProfileSigninUseCase>(
        create: (context) => ProfileSigninUseCase(
              context.read(),
              context.read(),
              context.read(),
            )),
    RepositoryProvider<CreateGroupUseCase>(
        create: (context) => CreateGroupUseCase(
              context.read(),
              context.read(),
            )),
    RepositoryProvider<LoginUsecase>(
        create: (context) => LoginUsecase(
              context.read(),
              context.read(),
            )),
    RepositoryProvider<LogoutUsecase>(
        create: (context) => LogoutUsecase(
              context.read(),
              context.read(),
            )),
  ];
}
