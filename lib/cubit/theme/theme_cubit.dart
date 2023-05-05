import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '/widget/components.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool _isDark = darkMode.getData(key: 'darkMode')??false;
  bool get isDark =>_isDark;
  void changeTheme(){
   
    _isDark =! _isDark;
    darkMode.putData(key: 'darkMode', valu: _isDark);
    emit(ThemeChange());
  }
}
