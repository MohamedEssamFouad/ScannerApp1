import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Const/constss.dart';


class hstory extends StatelessWidget {
  final Color CircColor;
  final IconData icon;
  final String text;
  final String title;
  final IconData smallIc;
  final String smallTe;
  final IconData secIc;
  final String secTe;
  final IconData? BigIcon;
  const hstory({Key? key, required this.CircColor, required this.icon, required this.text, required this.title, required this.smallIc, required this.smallTe, required this.secIc, required this.secTe,  this.BigIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        backgroundColor: MyColors.myCustomColor,

        title:Text(
          'History',
            style: TextStyle(
              color: Colors.white,
            ),
        ),


      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth > 600 ? 30 : 10,
            vertical: 10,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: MyColors.Containers,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                      backgroundColor:CircColor,

                          child: Icon(icon,color: Colors.white,),

                      ),
                      //SizedBox(width: 20,),
                      Padding(
                        padding: EdgeInsets.only(right:80,top: 10,bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(text,style: TextStyle(

                            ),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            SizedBox(height: 5,),
                            Text(title),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(smallIc,color: MyColors.myCustomColor,),
                                Text(smallTe),
                             SizedBox(width: 20,),

                                Icon(smallIc,color: MyColors.myCustomColor,),
                                Text(smallTe),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(BigIcon,color: MyColors.myCustomColor,),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
