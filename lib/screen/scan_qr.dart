import 'package:easy_ticket_driver/widget/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shapes/my_ticket_metro copy.dart';
import '../widget/Buttom.dart';
import '../widget/dialog.dart';

class ScanQrScreen extends StatelessWidget {
  const ScanQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: DefaultButtom(
              Child: Text(
                "Scan Qr Code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              radius: 15,
              OnTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DefaultDialog(
                          Child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close_outlined,
                                      size: 35.w,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            myTicketMetro(
                              onTap: () {},
                            )
                          ]));
                    });
              },
              Height: 40,
              Width: 200,
              PaddingHorizontal: 0,
              PaddingVertical: 0)),
    );
  }
}
