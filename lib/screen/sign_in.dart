// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable, unused_import

import '../cubit/sign_in/sign_in_cubit.dart';
import '../cubit/sign_in/sign_in_states.dart';
import '../screen/bottom_bar.dart';
import '../shapes/ticket_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/Buttom.dart';
import '../widget/components.dart';
import '../widget/text_Form_Field.dart';

import '../cubit/sign_in/sign_in_cubit.dart';
import '../cubit/sign_in/sign_in_states.dart';
import '../models/sign_in_model.dart';
import '../widget/constants.dart';

class Sign_In extends StatelessWidget {
  Sign_In({super.key});

  static const String routeName = 'Sign_in';
  var IDController = TextEditingController();
  var PasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) => SignInCubit(),
          child: BlocConsumer<SignInCubit, SignInStates>(
            listener: (context, state) {
              if (state is SignInSuccessState) {
                if (state.loginModel!.status == true) {
                  CacheHelper.saveData(
                          key: 'token', value: state.loginModel!.token)
                      .then((value) {
                    print(state.loginModel!.token);
                    CacheHelper.saveData(
                        key: 'id_driver',
                        value: state.loginModel!.data!.id_driver);
                    {
                      navigateAndFinish(
                        context,
                        const BottomBar(),
                      );
                    }
                    showToast(
                        text: state.loginModel!.message!,
                        state: ToastStates.success);
                  });
                } else if (state.loginModel!.status == false) {
                  print(state.loginModel!);
                  print(state.loginModel!.message);
                  showToast(
                      text: state.loginModel!.message!,
                      state: ToastStates.error);
                } else {
                  showToast(
                      text:
                          'There is a problem connecting to the server or the Internet',
                      state: ToastStates.warning);
                }
              }
            },
            builder: (context, state) {
              return Scaffold(
                body: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(children: [
                          Transform.rotate(
                            angle: 44.75,
                            child: logoTicket,
                          ),
                          SizedBox(
                            height: 80.h,
                          ),
                          DefaultFormField(
                            prefixIcon: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 10.w, end: 10.w),
                              child: Icon(
                                Icons.account_circle,
                                size: 30.h,
                              ),
                            ),
                            label: 'ID',
                            keyboardType: TextInputType.number,
                            validate: (String? value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter your ID';
                              }
                              return null;
                            },
                            controller: IDController,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DefaultFormField(
                            isPassword: SignInCubit.get(context).isPassword,
                            prefixIcon: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 10.w, end: 10.w),
                              child: Icon(
                                Icons.lock_outline,
                                size: 30.h,
                              ),
                            ),
                            suffixIcon: SignInCubit.get(context).suffix,
                            suffixPressed: () {
                              SignInCubit.get(context).showPasswordLogin();
                            },
                            label: 'Password',
                            keyboardType: TextInputType.text,
                            validate: (String? value) {
                              if (value!.trim().isEmpty) {
                                return 'Please enter your Password';
                              }
                              return null;
                            },
                            controller: PasswordController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefaultButtom(
                            OnTap: () {
                              if (formKey.currentState!.validate()) {
                                SignInCubit.get(context).driverLogin(
                                    id_driver: IDController.text,
                                    password: PasswordController.text,
                                    context: context);
                              }
                            },
                            Child: Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 28.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Height: 43,
                            Width: double.infinity,
                            PaddingHorizontal: 30,
                            PaddingVertical: 0,
                            radius: 15,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
