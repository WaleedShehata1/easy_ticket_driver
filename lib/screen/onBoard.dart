// ignore_for_file: camel_case_types, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../shapes/shape_GetStart.dart';
import '../widget/Buttom.dart';
import '../widget/components.dart';
import 'sign_in.dart';

class onBoard extends StatelessWidget {
  const onBoard({super.key});
  static const String routeName = 'onBoard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  getStartShape,
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Welcome to Easy Ticket',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 340,
                    child: Text(
                      "Quick & Easy to Travel anywhere & anytime",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              DefaultButtom(
                OnTap: () {
                  CacheHelper.putData(key: 'firstTime', value: true).then(
                      (value) => Navigator.pushReplacementNamed(
                          context, Sign_In.routeName));
                  Navigator.pushReplacementNamed(context, Sign_In.routeName);
                },
                Child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 28.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 28.w,
                      color: Colors.white,
                    )
                  ],
                ),
                Height: 60,
                Width: double.infinity,
                PaddingHorizontal: 30,
                PaddingVertical: 30,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
