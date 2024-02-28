import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../Const/constss.dart';
import 'Detailsoff_App_screen.dart';

class AppQ extends StatelessWidget {
  const AppQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
     appBar: AppBar(
       backgroundColor: MyColors.myCustomColor,
       title: Text(
         'Create App QR code',

       ),
     ),
      body: SafeArea(
        child: Column(
          children: [
            Details_App_Scren(
              firstIc: Icons.apps,
              text: 'Chat',
              lastIc: Icons.arrow_forward_ios,
            ),
            Details_App_Scren(
              firstIc: Icons.apps,
              text: 'Chat',
              lastIc: Icons.arrow_forward_ios,
            ),
            Details_App_Scren(
              firstIc: Icons.apps,
              text: 'Chat',
              lastIc: Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
