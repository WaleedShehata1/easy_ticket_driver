// ignore_for_file: library_private_types_in_public_api

import '../network/local/dio_helper.dart';
import '../network/remote/end_points.dart';
import '../screen/sign_in.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/theme/theme_cubit.dart';
import '../widget/Buttom.dart';
import '../widget/components.dart';
import '../widget/constants.dart';
import '../widget/dialog.dart';
import '../widget/drop_down_list.dart';

class UserSettingsScreen extends StatefulWidget {
  static const String routeName = 'profile';

  const UserSettingsScreen({super.key});
  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  var _busList;

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: false);
    // AppCubit bus = BlocProvider.of<AppCubit>(context, listen: false);
    List? busList = [
      {"id": 1, "bus_number": "BS9"},
      {"id": 2, "bus_number": "BS8"},
      {"id": 3, "bus_number": "BS7"},
      {"id": 4, "bus_number": "BS6"},
      {"id": 5, "bus_number": "BS5"},
      {"id": 6, "bus_number": "BS4"},
    ];
    //busList = bus.bus!.data as List;
    return Scaffold(
      backgroundColor: theme.isDark ? DarkColour : Colors.white,
      body: Column(children: [
        Stack(alignment: Alignment.center, children: [
          Container(
            decoration: BoxDecoration(
                color: PrimaryColour,
                borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))
                    .r),
            height: 100.h,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Abdulhamed Ashry',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              Container(
                margin: const EdgeInsets.all(5).w,
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45).r,
                    border: Border.all(width: 5.w, color: PrimaryColour)),
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 75.w,
                ),
              ),
            ],
          ),
        ]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 25),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: PrimaryColour,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "flight data",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 30,
                ),
                DefaultDropdown(
                  color: Colors.black,
                  labelText: 'Bus Number',
                  radius: 15,
                  width: 250,
                  validator: (p0) {},
                  value: _busList,
                  onChanged: (value) {
                    setState(() {
                      _busList = value;
                    });
                  },
                  items: busList.map<DropdownMenuItem<String>>((var value) {
                    return DropdownMenuItem<String>(
                      value: value["bus_number"],
                      child: Text(value["bus_number"]),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 40,
                ),
                DefaultButtom(
                    color: Colors.white,
                    Child: Text(
                      'Start the flight ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Height: 40,
                    Width: 120,
                    radius: 15,
                    OnTap: () {
                      /* setState(() {
                        showToast(
                            text: "succeeded", state: ToastStates.success);
                      }); */
                    },
                    PaddingHorizontal: 0,
                    PaddingVertical: 0),
                SizedBox(
                  height: 10,
                ),
              ]),
            ),
            SizedBox(height: 30.h),
            ListTile(
              onTap: () => setState(() {
                theme.changeTheme();
                CacheHelper.putData(key: 'isDarkMode', value: theme.isDark);
              }),
              minVerticalPadding: 15.h,
              leading: Icon(
                Icons.dark_mode,
                size: 35.w,
                color: theme.isDark ? Colors.white : Colors.black,
              ),
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: theme.isDark ? Colors.white : Colors.black,
                ),
              ),
              trailing: Switch(
                value: theme.isDark,
                activeTrackColor: Colors.white,
                activeColor: PrimaryColour,
                inactiveThumbColor: PrimaryColour,
                inactiveTrackColor: Colors.black,
                onChanged: (value) {
                  setState(() {
                    theme.changeTheme();
                    CacheHelper.putData(key: 'isDarkMode', value: theme.isDark);
                  });
                },
              ),
            ),
            ListTile(
              minVerticalPadding: 20.h,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DefaultDialog(
                          //  backgroundColor: PrimaryColour,
                          Child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Do you want to Log out ?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    wordSpacing: 1,
                                    //  color: Colors.white,
                                    color: PrimaryColour,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DefaultButtom(
                                    Child: Text(
                                      'Yes',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Height: 30,
                                    Width: 50,
                                    PaddingHorizontal: 5,
                                    PaddingVertical: 0,
                                    OnTap: () {
                                      navigateAndFinish(context, Sign_In());
                                      DioHelper.postData(
                                        url: logout,
                                        token:
                                            CacheHelper.getData(key: 'token'),
                                        data: {
                                          'token':
                                              CacheHelper.getData(key: 'token')
                                        },
                                      ).then((value) {
                                        print("value = ${value.data}");
                                        CacheHelper.clearData(key: 'token')
                                            .then((value) {
                                          if (value!) {
                                            CacheHelper.clearData(key: 'uid');
                                            CacheHelper.clearData(
                                                key: 'userName');
                                            CacheHelper.clearData(key: 'token');
                                          }
                                          /*  showToast(
                                              text: 'succeeded',
                                              state: ToastStates.success); */
                                        });
                                      }).catchError((error) {
                                        print("error= ${error.toString()}");
                                      });
                                    },
                                  ),
                                  DefaultButtom(
                                    Child: Text(
                                      'No',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Height: 30,
                                    Width: 50,
                                    PaddingHorizontal: 5,
                                    PaddingVertical: 0,
                                    OnTap: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                    });
              },
              leading: Icon(
                Icons.logout,
                size: 35.w,
                color: theme.isDark ? Colors.white : Colors.black,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
