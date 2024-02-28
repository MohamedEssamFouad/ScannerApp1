import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';
import '../../../Const/constss.dart';
import '../../../SharedPref/Helper.dart';
import '../../../SQFLITE&providers/QR_CodeData.dart';
import '../../../SharedPref/LastGeneratedDataPage.dart';
class QrResultPage extends StatefulWidget {
  final String qrData;

  QrResultPage({required this.qrData});

  @override
  State<QrResultPage> createState() => _QrResultPageState();
}

class _QrResultPageState extends State<QrResultPage> {

  late String formattedDateAndTime;
  late String formattedDateYMMMd;

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();
    final formatter = DateFormat('MMM dd, yyyy hh:mm a');
    final formatterYMMMd = DateFormat.yMMMd().add_jm();

    formattedDateAndTime = formatter.format(now);
    formattedDateYMMMd = formatterYMMMd.format(now);
  }

  @override
  Widget build(BuildContext context) {
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
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: MyColors.Containers,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: QrImage(
                  data: widget.qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: MyColors.Containers,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),

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
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Text(
                                    '${widget.qrData}',
                                    style: TextStyle(fontSize: 18),maxLines:5,
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.date_range,
                                        color: MyColors.myCustomColor,
                                      ),
                                      SizedBox(width: 9),
                                      Text(
                                        DateFormat('hh:mm a').format(DateTime.now()),
                                      ),

                                      SizedBox(width: 6),
                                      Icon(
                                        Icons.update_rounded,
                                        color: MyColors.myCustomColor,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        DateFormat('MMM d, yyyy').format(DateTime.now()),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
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
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

