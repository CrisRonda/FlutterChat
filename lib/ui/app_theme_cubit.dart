import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeCubit extends Cubit<bool> {
  AppThemeCubit() : super(false);
  final _isDark = false;
  bool get isDark => _isDark;
  Future<void> init() async {
    emit(_isDark);
  }
}
