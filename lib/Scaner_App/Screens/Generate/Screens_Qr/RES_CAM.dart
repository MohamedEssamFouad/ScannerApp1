import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

import '../../../Const/constss.dart';
class RES_CAM extends StatelessWidget {

  final String code;
  final Function() closeScreen;

  const RES_CAM({required this.code, required this.closeScreen, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        backgroundColor: MyColors.myCustomColor,
        leading: IconButton(onPressed: (){
          closeScreen;
          Navigator.pop(context);
        },

          icon: Icon(
            Icons.arrow_back,
          ),
        ),

        title: Text(
          'QR Result ',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            QrImage(
              data: code,
              version: QrVersions.auto,
            ),

            SizedBox(height: 10,),
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: MyColors.Containers,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFF4B3D7A),
                          child: Icon(
                            Icons.document_scanner_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'QR CODE',
                            ),
                            SizedBox(height: 5),
                            Text(
                              '$code',
                              style: TextStyle(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: MyColors.myCustomColor,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'sep 23, 2023',
                                ),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.update_rounded,
                                  color: MyColors.myCustomColor,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '10:14 AM',
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {

                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 35),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Search on web',
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: MyColors.myCustomColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  CircleIconTile(
                    icon: Icons.edit,
                    text: 'Edit',
                  ),
                  CircleIconTile(
                    icon: Icons.delete,
                    text: 'Delete',
                  ),
                  CircleIconTile(
                    icon: Icons.copy,
                    text: 'Copy',
                  ),
                  CircleIconTile(
                    icon: Icons.save,
                    text: 'Save',
                  ),
                  CircleIconTile(
                    icon: Icons.share,
                    text: 'Share',
                  ),
                  CircleIconTile(
                    icon: Icons.star,
                    text: 'Favourite',
                  ),
                  CircleIconTile(
                    icon: Icons.text_fields,
                    text: 'CSV',
                  ),
                  CircleIconTile(
                    icon: Icons.file_copy_rounded,
                    text: 'TXT',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleIconTile extends StatelessWidget {
  final IconData icon;
  final String text;

  CircleIconTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: MyColors.myCustomColor,
            child: Icon(
              icon,
              color: Colors.white,
              size: 35,
            ),
          ),

          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

