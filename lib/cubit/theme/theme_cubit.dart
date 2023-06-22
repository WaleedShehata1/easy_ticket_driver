// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '/widget/components.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool _isDark = CacheHelper.getData(key: 'darkMode') ?? false;
  bool get isDark => _isDark;
  void changeTheme() {
    _isDark = !_isDark;
    CacheHelper.putData(key: 'darkMode', value: _isDark);
    emit(ThemeChange());
  }
}
