import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

import '../Const/constss.dart';
import '../SQFLITE&providers/QR_CodeData.dart';
import '../SQFLITE&providers/providers.dart';
import 'package:provider/provider.dart';
class ClipboardPage extends StatefulWidget {
  @override
  _ClipboardPageState createState() => _ClipboardPageState();
}

class _ClipboardPageState extends State<ClipboardPage> {

  late String formattedDateAndTime;
  late String formattedDateYMMMd;
  String clipboardText = '';

  @override
  void initState() {
    super.initState();

    _getClipboardData();
    final now = DateTime.now();
    final formatter = DateFormat('MMM dd, yyyy hh:mm a');
    final formatterYMMMd = DateFormat.yMMMd().add_jm();

    formattedDateAndTime = formatter.format(now);
    formattedDateYMMMd = formatterYMMMd.format(now);

  }
Future<void>_getClipboardData() async{
    final ClipboardData? data=await Clipboard.getData(Clipboard.kTextPlain);
    if (data!=null&&data.text!=null) {
      setState(() {
        clipboardText=data.text!;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final historyProvider = Provider.of<HistoryProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        backgroundColor: MyColors.myCustomColor,
        title: Text('Last Generated QR Code'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.Containers,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: double.infinity,
                alignment: Alignment.center,
                child: QrImage(

                  data: clipboardText,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ),




    SizedBox(height: 20),
            Expanded(
              child: Container(
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'QR CODE',
                                ),
                                SizedBox(height: 5),

                                Text('${clipboardText}',style: TextStyle(),maxLines: 4,),

                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      color: MyColors.myCustomColor,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      DateFormat('MMM d, yyyy').format(DateTime.now()),
                                    ),
                                    SizedBox(width: 6),
                                    Icon(
                                      Icons.update_rounded,
                                      color: MyColors.myCustomColor,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      DateFormat('hh:mm a').format(DateTime.now()),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () {
                                    final qrCodeData= QrCodeData(
                                      qrData: clipboardText,
                                      timestamp: DateTime.now(), processName: 'Call', iconIdentifier: 'call',
                                    );
                                     historyProvider.addQrCode(qrCodeData);
                                  },
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
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
            SizedBox(
              height: 10,
            ),
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