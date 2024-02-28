import 'package:flutter/material.dart';

import '../../../../Const/constss.dart';

import 'package:barcode_widget/barcode_widget.dart';

import '../../../../SharedPref/Helper.dart';

class BarRES extends StatelessWidget {
  final String Bar;
  final Barcode format;

  BarRES({required this.Bar,required this.format});

  @override
  Widget build(BuildContext context) {
    SharedPreferencesHelper.saveLastGeneratedQR(Bar);

    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        title: Text('QR Code Result'),
        backgroundColor: MyColors.myCustomColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyColors.Containers,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: BarcodeWidget(
                  data: Bar,
                  barcode: format,
                  color: Colors.black,
                  errorBuilder: (context, error) => Text('Error: $error'),
                ),
              ),
            ),
            SizedBox(height: 20),
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
                              'BAR CODE',
                            ),
                            SizedBox(height: 5),
                            Text(
                              '$Bar',
                              style: TextStyle(fontSize: 18),
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
          //SizedBox(height: 25),
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
