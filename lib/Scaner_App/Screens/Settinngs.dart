import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yr_nova/Scaner_App/Const/constss.dart';

class Sett extends StatefulWidget {
  const Sett({Key? key}) : super(key: key);

  @override
  State<Sett> createState() => _SettState();
}

class _SettState extends State<Sett> {
  bool isSwitched = false;
  bool isSwitched1 = false;
  bool isSwitched2= false;
  bool isSwitched3= false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
   appBar: AppBar(
     backgroundColor: MyColors.myCustomColor,
     title: Text('Settings'),
   ),
      backgroundColor: MyColors.scaffold,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: SafeArea(
            child: Column(
              children: [
                Container(

                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.myCustomColor,

                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 35,
                          color: Colors.white,
                        ),
                       SizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pro Version' ,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),

                              ),
                              Text(
                                'Remove Ads',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 125,),
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13,),
                Divider(
                  color: Color(0xFFBFBFBF),
                  height: 1,
                  thickness: 1,
                ),
                SizedBox(height: 13,),
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFFFFF),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'General',
                          style: TextStyle(
                            color: MyColors.myCustomColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.document_scanner_outlined,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'QR Code Settings',
                                style: TextStyle(
                                  fontSize: 20,
                             //     fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          //  SizedBox(width: 35,),
                            Icon(
                              Icons.chat_bubble_outline,
                              color: MyColors.myCustomColor,
                            ),
                    //SizedBox(width: 10,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: MyColors.myCustomColor,)),
                          ],
                        ),
                        SizedBox(height: 13,),
                        Divider(
                          color: Color(0xFFBFBFBF),
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Indroduction',
                                style: TextStyle(
                                  fontSize: 20,
                               //   fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),

                            //SizedBox(width: 10,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: MyColors.myCustomColor,)),
                          ],
                        ),
                        SizedBox(height: 13,),
                        Divider(
                          color: Color(0xFFBFBFBF),
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.document_scanner_outlined,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Theme',
                                style: TextStyle(
                                  fontSize: 20,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),
                           Text(
                             'Light',
                             style: TextStyle(
                            //   fontWeight: FontWeight.bold,
                               fontSize: 15,
                               color: MyColors.myCustomColor
                             ),
                           ),
                            //SizedBox(width: 10,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: MyColors.myCustomColor,)),
                          ],
                        ),
                        SizedBox(height: 13,),
                        Divider(
                          color: Color(0xFFBFBFBF),
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Language Options',
                                style: TextStyle(
                                  fontSize: 20,
                                //  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),
                            Icon(
                              Icons.south_america,
                              color: MyColors.myCustomColor,
                            ),

                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: MyColors.myCustomColor,)),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13,),
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFFFFF),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scan Controls',
                          style: TextStyle(
                            color: MyColors.myCustomColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.settings_voice,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Play Sound',
                                style: TextStyle(
                                  fontSize: 20,
                               //   fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),

                            //SizedBox(width: 10,),
                            Switch(
                                activeTrackColor:Color(0xFFF2A8A7),
                                activeColor: MyColors.myCustomColor,


                                value: isSwitched, onChanged:(val){
                              setState(() {
                                isSwitched = val;
                              });


                            }

                            ),
                          ],
                        ),
                        SizedBox(height: 13,),
                        Divider(
                          color: Color(0xFFBFBFBF),
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.vibration,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Vibrate',
                                style: TextStyle(
                                  fontSize: 20,
                                  //   fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),

                            //SizedBox(width: 10,),
                            Switch(
                                activeTrackColor:Color(0xFFF2A8A7),
                                activeColor: MyColors.myCustomColor,


                                value: isSwitched3, onChanged:(val){
                              setState(() {
                                isSwitched3 = val;
                              });


                            }

                            ),
                          ],
                        ),
                        SizedBox(height: 13,),
                        Divider(
                          color: Color(0xFFBFBFBF),
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.copy,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Copy to Clipboard',
                                style: TextStyle(
                                  fontSize: 20,
                                  //   fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Switch(
                                activeTrackColor:Color(0xFFF2A8A7),
                                activeColor: MyColors.myCustomColor,


                                value: isSwitched2, onChanged:(val){
                              setState(() {
                                isSwitched2= val;
                              });


                            }

                            ),
                          ],
                        ),
                        SizedBox(height: 13,),
                        Divider(
                          color: Color(0xFFBFBFBF),
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.web,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Auto Web Search',
                                style: TextStyle(
                                  fontSize: 20,
                                  //   fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),

                            //SizedBox(width: 10,),
                            Switch(
                                activeTrackColor:Color(0xFFF2A8A7),
                                activeColor: MyColors.myCustomColor,


                                value: isSwitched1, onChanged:(val){
                              setState(() {
                                isSwitched1= val;
                              });


                            }

                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13,),
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFFFFF),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUPPORT US',
                          style: TextStyle(
                            color: MyColors.myCustomColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.mark_unread_chat_alt,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Feedback',
                                style: TextStyle(
                                  fontSize: 20,
                                 // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),

                            //SizedBox(width: 10,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: MyColors.myCustomColor,)),
                          ],
                        ),
                        SizedBox(height: 13,),
                        Divider(
                          color: Color(0xFFBFBFBF),
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.star_rate,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Rate Us',
                                style: TextStyle(
                                  fontSize: 20,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),

                            //SizedBox(width: 10,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: MyColors.myCustomColor,)),
                          ],
                        ),
                        SizedBox(height: 13,),
                        Divider(
                          color: Color(0xFFBFBFBF),
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Share with Friends',
                                style: TextStyle(
                                  fontSize: 20,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),

                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: MyColors.myCustomColor,)),
                          ],
                        ),




                      ],
                    ),
                  ),
                ),
                SizedBox(height: 13,),
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFFFFF),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ABOUT',
                          style: TextStyle(
                            color: MyColors.myCustomColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.privacy_tip_outlined,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),

                            //SizedBox(width: 10,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: MyColors.myCustomColor,)),
                          ],
                        ),
                        SizedBox(height: 13,),
                        Divider(
                          color: Color(0xFFBFBFBF),
                          height: 1,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: MyColors.myCustomColor,
                              child: Icon(
                                Icons.privacy_tip_outlined,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                'App version',
                                style: TextStyle(
                                  fontSize: 20,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //  SizedBox(width: 35,),

                            //SizedBox(width: 10,),
                            TextButton(onPressed: (){},
                              child: Text('v 1.0.0',style: TextStyle(fontWeight: FontWeight.bold,color: MyColors.myCustomColor),),
                            ),
                            ],
                        ),





                      ],
                    ),
                  ),
                ),

              ],
            ),

          ),
        ),
      ),
    );
  }
}
