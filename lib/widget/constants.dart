// ignore_for_file: non_constant_identifier_names

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../cubit/app/app_cubit.dart';
import 'components.dart';

void showToast({
  required String text,
  required ToastStates state,
}) =>
    {
      Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: chooseToastColor(state),
          textColor: Colors.white,
          fontSize: 16.0)
    };

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;

    case ToastStates.error:
      color = Colors.red;
      break;

    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

String? token = CacheHelper.getData(key: 'token');
String? uid = CacheHelper.getData(key: 'uid');
String? userEmail = CacheHelper.getData(key: 'email');
String? userName = CacheHelper.getData(key: "userName");
String? national_ID = CacheHelper.getData(key: "national_ID");
late AppCubit user;
