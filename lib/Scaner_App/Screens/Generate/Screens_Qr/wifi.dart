import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yr_nova/Scaner_App/Screens/Generate/Screens_Qr/qr_result_page.dart';


import '../../../Const/constss.dart';
import '../../../SQFLITE&providers/QR_CodeData.dart';
import '../../../SQFLITE&providers/providers.dart';
import 'package:provider/provider.dart';
class wifi_q extends StatefulWidget {
  const wifi_q({Key? key}) : super(key: key);

  @override
  State<wifi_q> createState() => _wifi_qState();
}

class _wifi_qState extends State<wifi_q> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  String selectedSecurity = 'WPA/WPA2';
  String qrData = '';

  @override
  Widget build(BuildContext context) {
    final double coverH = 40;
    final double profileH = 80;
    final top = coverH - profileH / 2;
    final historyProvider = Provider.of<HistoryProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        backgroundColor: MyColors.myCustomColor,
        title: Text('Create WiFi QR Code'),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: [
                          Container(
                            height: selectedSecurity == 'None' ? 240 : 330,
                            decoration: BoxDecoration(
                              color: MyColors.Containers,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    keyboardType: TextInputType.text,
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter SSID',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.myCustomColor),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Select security mode',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSecurity = 'WPA/WPA2';
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: MyColors.myCustomColor,
                                              ),
                                              color: selectedSecurity == 'WPA/WPA2'
                                                  ? MyColors.myCustomColor
                                                  : MyColors.Containers,
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'WPA/WPA2',
                                                style: TextStyle(
                                                  color: selectedSecurity == 'WPA/WPA2'
                                                      ? Colors.white
                                                      : MyColors.myCustomColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSecurity = 'WEP';
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: selectedSecurity == 'WEP'
                                                  ? MyColors.myCustomColor
                                                  : MyColors.Containers,
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                color: MyColors.myCustomColor,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'WEP',
                                                style: TextStyle(
                                                  color: selectedSecurity == 'WEP'
                                                      ? Colors.white
                                                      : MyColors.myCustomColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSecurity = 'None';
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              color: selectedSecurity == 'None'
                                                  ? MyColors.myCustomColor
                                                  : MyColors.Containers,
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(
                                                color: MyColors.myCustomColor,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'None',
                                                style: TextStyle(
                                                  color: selectedSecurity == 'None'
                                                      ? Colors.white
                                                      : MyColors.myCustomColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  if (selectedSecurity != 'None')
                                  TextField(
                                      controller: textEditingController2,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Password',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: MyColors.myCustomColor),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(height: 7,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: MyColors.myCustomColor,
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: (){
                                              textEditingController.clear();
                                              textEditingController2.clear();
                                            },
                                            child: Text(
                                              'RESET',
                                              style: TextStyle(
                                                color: MyColors.myCustomColor,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            final enteredText = textEditingController.text;
                                            final enteredText2 = textEditingController2.text;
                                            if (enteredText.isNotEmpty &&
                                                (selectedSecurity == 'WPA/WPA2' || selectedSecurity == 'WEP')) {
                                              setState(() {
                                                qrData = 'WIFI:S:$enteredText;T:$selectedSecurity;P:$enteredText2;;';
                                              });
                                              final qrCodeData = QrCodeData(
                                                qrData: qrData,
                                                timestamp: DateTime.now(),
                                                processName: 'Wi-Fi',
                                                iconIdentifier: 'wifi',
                                              );

                                              historyProvider.addQrCode(qrCodeData);

                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) => QrResultPage(qrData: qrData),
                                                ),
                                              );
                                            } else if (enteredText.isNotEmpty && selectedSecurity == 'None') {
                                              setState(() {
                                                qrData = 'WIFI:S:$enteredText;T:nopass;;';
                                              });
                                              final qrCodeData = QrCodeData(
                                                qrData: qrData,
                                                timestamp: DateTime.now(),
                                                processName: 'Wi-Fi',
                                                iconIdentifier: 'wifi',
                                              );

                                              historyProvider.addQrCode(qrCodeData);

                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) => QrResultPage(qrData: qrData),
                                                ),
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Error'),
                                                    content: Text('Text field is empty. Please enter some text.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 150,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: MyColors.myCustomColor,
                                              border: Border.all(
                                                color: MyColors.myCustomColor,
                                              ),
                                            ),
                                            child: Text(
                                              'GENERATE',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),

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
                    Positioned(
                      top: top,
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor:     Color(0xFF3AAE6D),
                        child: Icon(
                          Icons.wifi,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
