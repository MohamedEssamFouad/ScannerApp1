import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yr_nova/Scaner_App/Screens/Generate/Screens_Qr/qr_result_page.dart';

import 'package:provider/provider.dart';
import '../../../Const/constss.dart';
import '../../../SQFLITE&providers/QR_CodeData.dart';
import '../../../SQFLITE&providers/providers.dart';

class sms_q extends StatefulWidget {
  const sms_q({Key? key}) : super(key: key);

  @override
  State<sms_q> createState() => _sms_qState();
}

class _sms_qState extends State<sms_q> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2=TextEditingController();

  String qrData = '';

  @override
  Widget build(BuildContext context) {
    final double coverH = 40;
    final double profileH = 80;
    final top = coverH - profileH / 2;
    final historyProvider=Provider.of<HistoryProvider>(context,listen: false);

    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        backgroundColor: MyColors.myCustomColor,
        title: Text('Create SMS QR Code'),
      ),
      body: SafeArea(
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
                          height: 250,
                          decoration: BoxDecoration(
                            color: MyColors.Containers,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 25),
                            child: Column(
                              children: [
                                TextField(
                                  keyboardType: TextInputType.number,
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    hintText: 'Please Enter Phone Number',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: MyColors.myCustomColor),
                                    ),

                                  ),

                                ),
                                TextField(
                                  controller:textEditingController2 ,
                                      keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'Please Enter Content',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: MyColors.myCustomColor),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 25)
                                  ),

                                ),

                              Spacer(),

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
                                          if (enteredText.isNotEmpty) {
                                            setState(() {
                                              qrData = 'SMS\n$enteredText\n $enteredText2';
                                            });

                                            final qrCodeData = QrCodeData(
                                              qrData: qrData,
                                              timestamp: DateTime.now(), processName: 'SMS', iconIdentifier: 'sms',
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
                      backgroundColor:     Color(0xFFFA4C45),

                      child: Icon(
                        Icons.sms,
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
    );
  }
}
