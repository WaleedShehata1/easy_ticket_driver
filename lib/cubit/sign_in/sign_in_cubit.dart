// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:easy_ticket_driver/cubit/sign_in/sign_in_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/local/dio_helper.dart';
import '../../network/remote/end_points.dart';
import '../../widget/components.dart';
import '../../widget/model.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  SignInModel? loginModel;

  static SignInCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility_outlined;

  bool isPassword = true;

  void showPasswordLogin() {
    isPassword = !isPassword;

    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShowPassword());
  }

  driverLogin({required String id_driver, required String password, context}) {
    emit(SignInLoadingState());
    DioHelper.postData(
      url: login,
      data: {
        'id_driver': id_driver,
        'password': password,
      },
    ).then((value) {
      emit(SignInLoadingState());
      print('Value == ${value.data}');
      loginModel = SignInModel.fromJson(value.data);
      CacheHelper.saveData(key: 'uid', value: loginModel!.data!.uid);
      print("token=${loginModel!.token}");
      CacheHelper.saveData(
          key: 'userName',
          value:
              '${SignInCubit.get(context).loginModel!.data!.first_Name} ${SignInCubit.get(context).loginModel!.data!.last_Name}');
      emit(SignInSuccessState(loginModel));
    }).catchError((error) {
      print("error=${error.toString()}");
      emit(SignInErrorState(error.toString()));
    });
  }
}
