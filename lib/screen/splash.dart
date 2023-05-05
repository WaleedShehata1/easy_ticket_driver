// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'dart:async';


import '../screen/onBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shapes/ticket_logo.dart';
import '../widget/components.dart';
import 'sign_in.dart';


class splash extends StatefulWidget {
  
static const String routeName = 'splash'; 
const splash({super.key,});
 

  @override
  State<splash> createState() => _splashState();
}


class _splashState extends State<splash> { 
 bool? FirstTime = firstTime.getData(key: 'firstTime');
   @override
  void initState() {
       super.initState();
    Timer(
      const Duration(seconds:5), 
      () {
        if(FirstTime ==true)
        {
               Navigator.pushReplacementNamed(context,Sign_In.routeName );
        }else
        {
              Navigator.pushReplacementNamed(context,onBoard.routeName );
        }
      }
         );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Transform.rotate(
      angle: 44.75,
      child: logoTicket,
      ),
       SizedBox(
        height: 20.h,
      ),
      Text(
            'EasyTicket',
          style: TextStyle(
            fontFamily: 'Jomhuria',
            fontSize: 45.sp,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).textTheme.subtitle2!.color!,
            ),
            ),
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           Text(
            'Driver',
          style: TextStyle(
            fontFamily: 'Jomhuria',
            fontSize: 45.sp,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).textTheme.subtitle2!.color!,
            ),
            ),
             Container(
              margin: const EdgeInsetsDirectional.fromSTEB(12,0, 0, 12),
            decoration: BoxDecoration(
              
               color:  PrimaryColour,
              borderRadius:  BorderRadius.all(Radius.circular(8.r)),
              ),
              width: 15.w,
              height:15.h,
      ),
        ],
      ),


  ],
),
      
    );
  }
}

