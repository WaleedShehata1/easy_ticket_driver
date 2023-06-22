// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/App/app_cubit.dart';
import 'cubit/theme/theme_cubit.dart';
import 'network/local/dio_helper.dart';
import 'screen/bottom_bar.dart';
import 'screen/onBoard.dart';
import 'screen/profile.dart';
import 'screen/sign_in.dart';
import 'screen/splash.dart';
import 'widget/theme.dart';
import 'widget/components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => ThemeCubit(),
      ),
      BlocProvider(
        create: (context) => AppCubit()
          ..getBusList()
          ..bus,
      )
    ], child: const MyApp()),
  );
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme.isDark ? ThemeClass.darkTheme : ThemeData.light(),
          home: child,
          routes: {
            splash.routeName: (context) => const splash(),
            onBoard.routeName: (context) => const onBoard(),
            Sign_In.routeName: (context) => Sign_In(),
            BottomBar.routeName: (context) => const BottomBar(),
            UserSettingsScreen.routeName: (context) =>
                const UserSettingsScreen(),
          },
        );
      },
      child: const splash(),
    );
  }
}
