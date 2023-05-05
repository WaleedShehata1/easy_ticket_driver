// ignore_for_file: library_private_types_in_public_api

import '../screen/sign_in.dart';
import '../widget/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/theme/theme_cubit.dart';


class UserSettingsScreen extends StatefulWidget {
  static const String routeName = 'profile';

  const UserSettingsScreen({super.key});
  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
 

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context,listen: false);
    return Scaffold(
      backgroundColor: theme.isDark?  DarkColour : Colors.white,
      body: Column(children: [
        Stack(alignment: Alignment.center, children: [
          Container(
            decoration: BoxDecoration(
                color: PrimaryColour,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)).r),
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
                child:  Icon(
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
            ListTile(
              onTap: () =>  setState(() {
                    theme.changeTheme() ;
                    firstTime.putData(key: 'isDarkMode', valu:theme.isDark );
                  }),
              minVerticalPadding: 15.h ,
              leading: Icon(
                Icons.dark_mode,
                size: 35.w,
                color:  theme.isDark?  Colors.white : Colors.black,
              ),
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: theme.isDark?  Colors.white : Colors.black,
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
                    theme.changeTheme() ;
                    firstTime.putData(key: 'isDarkMode', valu:theme.isDark );
                  });
                },
              ),
            ),
            ListTile(
              minVerticalPadding: 15.h ,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AboutusScreen()),
                // );
              },
              leading: Icon(
                Icons.contact_support_rounded,
                size: 35.w,
                color:  theme.isDark?  Colors.white : Colors.black,
              ),
              title: Text(
                'About us',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color:  theme.isDark?  Colors.white : Colors.black,
                ),
              ),
            ),
            ListTile(
              minVerticalPadding: 15.h ,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => TeamMembersScreen()),
                // );
              },
              leading: Icon(
                Icons.person_3_rounded,
                size: 35.w,
                color: theme.isDark?  Colors.white : Colors.black,
              ),
              title: Text(
                'Team Members',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color:  theme.isDark?  Colors.white : Colors.black,
                ),
              ),
            ),
            ListTile(
              
              minVerticalPadding: 20.h ,
              onTap: () {
                showDialog(context: context, builder: (context){
                  return DefaultDialog(
                  //  backgroundColor: PrimaryColour,
                    Child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.w,
                      child: Column(mainAxisSize: MainAxisSize.min,
                        children: [
         SizedBox(height: 10.h,),
                          Text('Do you want to Log out ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            wordSpacing: 1,
                          //  color: Colors.white, 
                            color: PrimaryColour, 
                            fontSize: 26,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultButtom(Child:  Text('Yes',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                               // color: Colors.black,
                                color: Colors.white,
                                
                                ),), Height:30, Width: 50, 
                                PaddingHorizontal: 5,
                                 PaddingVertical: 0,
                                 OnTap: () {
                                Navigator.pushReplacementNamed(context, Sign_In.routeName);
                              },
                            //  color: Colors.white,
                              ),
                              DefaultButtom(
                                Child:  Text('No',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                 // color: Colors.black,
                                color: Colors.white,
                                ),), Height:30,
                                 Width: 50, 
                                 PaddingHorizontal: 5,
                                  PaddingVertical: 0,
                                  OnTap: () {
                                Navigator.pop(context);
                              },
                              //color: Colors.white,
                              )
                            ],
                          )
                        ],),
                    ),
                  ) );
                });
              },
              leading: Icon(
                Icons.logout,
                size: 35.w,
                color:  theme.isDark?  Colors.white : Colors.black,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color:  theme.isDark?  Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
