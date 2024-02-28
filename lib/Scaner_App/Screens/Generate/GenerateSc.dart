import 'package:flutter/material.dart';
import '../../Const/constss.dart';
import '../../SharedPref/Helper.dart';
import '../../SharedPref/LastGeneratedDataPage.dart';
import '../../SharedPref/New.dart';
import 'Screens_Qr/BarCode.dart';
import 'Screens_Qr/app.dart';
import 'Screens_Qr/call.dart';
import 'Screens_Qr/contact.dart';

import 'Screens_Qr/email.dart';
import 'Screens_Qr/event.dart';
import 'Screens_Qr/location.dart';
import 'Screens_Qr/qr_result_page.dart';
import 'Screens_Qr/sms.dart';
import 'Screens_Qr/text.dart';
import 'Screens_Qr/website.dart';
import 'Screens_Qr/wifi.dart';



class Generatee extends StatelessWidget {

  final List<String> itemTitles = [
    'Content from clipboard',
    'Website',
    'Text',
    'Contact',
    'Email',
    'SMS',
    'Location',
    'Call',
    'Event',
    'WiFi',
    'App',
    'BarCodes and other 2D codes',
  ];

  final List<Widget> screens = [

    ClipboardPage(),
    website_q(),
    text_q(),
    contact(),
    email_q(),
    sms_q(),
    locartion_Q(),
    Call(),
    event_q(),
    wifi_q(),
    AppQ(),
    BarCODE(),
  ];

  final List<IconData> iconSh = [
    Icons.content_copy_outlined,
    Icons.web,
    Icons.text_fields,
    Icons.contacts,
    Icons.email,
    Icons.sms,
    Icons.location_on,
    Icons.call,
    Icons.event,
    Icons.wifi,
    Icons.apps,
    Icons.qr_code,
  ];
  final List<Color> backgroundColors = [
    Color(0xFFF3B755),
    Color(0xFF3C579A),
    Color(0xFF81C16B),
    Color(0xFF4786C9),
    Color(0xFFB15B9C),
    Color(0xFFFA4C45),
    Color(0xFF4CB9AE),
    Color(0xFF7B6BDA),
    Color(0xFFDF703B),
    Color(0xFF3AAE6D),
    Color(0xFF4B3D7A),
    Color(0xFFAF5A9D),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        title: Text('Generate QR'),
        backgroundColor: MyColors.myCustomColor,
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,

          ),
          itemCount: itemTitles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => screens[index],
                  ),
                );
              },
              child: Padding(
             padding: MyColors.customPadding,
            child: Material(
            elevation:1,
            borderRadius: BorderRadius.circular(10),
            child: Container(
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: backgroundColors[index],
                          child: Icon(iconSh[index],color: Colors.white,),),
                      SizedBox(height: 10),
                      Text(itemTitles[index],style: TextStyle(
                        color: MyColors.textC,
                      ),
                      textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
            );
          },
        ),
      ),
    );
  }
}