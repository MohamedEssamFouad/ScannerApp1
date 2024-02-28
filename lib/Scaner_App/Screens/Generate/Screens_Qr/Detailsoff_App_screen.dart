import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Const/constss.dart';

class Details_App_Scren extends StatelessWidget {
  const Details_App_Scren({Key? key, required this.firstIc, required this.text, required this.lastIc}) : super(key: key);
final IconData firstIc;
final String text;
final IconData lastIc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.Containers,
          borderRadius: BorderRadius.circular(15),

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(firstIc,color: MyColors.myCustomColor,),
              SizedBox(width: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text(text,style: TextStyle(fontSize: 18),),
              ),
              Expanded(
                flex: 2,
                child: IconButton(onPressed: (){},
                    icon: Icon(lastIc,color: MyColors.myCustomColor,),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
