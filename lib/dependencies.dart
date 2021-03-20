import 'package:chat_app/data/auth_repository.dart';
import 'package:chat_app/data/image_picker_repository.dart';
import 'package:chat_app/data/persisten_storage_repository.dart';
import 'package:chat_app/data/prod/auth_impl.dart';
import 'package:chat_app/data/prod/image_picker_impl.dart';
import 'package:chat_app/data/prod/persisten_storage_impl.dart';
import 'package:chat_app/data/prod/stream_api_impl.dart';
import 'package:chat_app/data/prod/upload_storage_impl.dart';
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
        create: (_) => StreamApiImpl(client)),
    RepositoryProvider<PersistentStorageRepository>(
        create: (_) => PersistenStorageImpl()),
    RepositoryProvider<AuthRepository>(create: (_) => AuthImpl()),
    RepositoryProvider<ImagePickerRepository>(create: (_) => ImagePickerImpl()),
    RepositoryProvider<UploadStorageRepository>(
        create: (_) => UploadStorageImpl()),
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
