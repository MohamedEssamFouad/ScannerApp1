import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Const/constss.dart';
import '../../../../SQFLITE&providers/QR_CodeData.dart';
import '../../../../SQFLITE&providers/providers.dart';
import '../qr_result_page.dart';
import 'BarCodeRES.dart';
import 'package:barcode/barcode.dart';
import 'package:provider/provider.dart';
class ICBN extends StatefulWidget {
  const ICBN({Key? key}) : super(key: key);

  @override
  State<ICBN> createState() => _ICBNState();
}

class _ICBNState extends State<ICBN> {
  TextEditingController textEditingController = TextEditingController();
  String BARCODE = '';

  @override
  Widget build(BuildContext context) {
    final double coverH = 40;
    final double profileH = 80;
    final top = coverH - profileH / 2;

    return Scaffold(
    backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        backgroundColor: MyColors.myCustomColor,
        title: Text('Create ISBN BarCode'),
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
                          height: 200,
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
                                    hintText: 'please enter type any 12 or 13 digits start with',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: MyColors.myCustomColor),
                                    ),
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 25),
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
                                            color:  MyColors.myCustomColor,
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            textEditingController.clear();
                                          },
                                          child: Text(
                                            'RESET',
                                            style: TextStyle(
                                              color:  MyColors.myCustomColor,
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
                                          final enteredText =
                                              textEditingController.text;
                                          if (enteredText.isNotEmpty) {
                                            setState(() {
                                              BARCODE = enteredText;
                                            });
                                            final qrCodeData = QrCodeData(
                                              qrData: BARCODE,
                                              timestamp: DateTime.now(), processName: 'ISBN', iconIdentifier: 'BARCODE',
                                            );
                                            final historyProvider = Provider.of<HistoryProvider>(context, listen: false);

                                            historyProvider.addQrCode(qrCodeData);

                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BarRES(Bar: BARCODE, format: Barcode.isbn(),),
                                              ),
                                            );
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder:
                                                  (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Error'),
                                                  content: Text(
                                                      'Text field is empty. Please enter some text.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
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
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            color:  MyColors.myCustomColor,
                                            border: Border.all(
                                              color:  MyColors.myCustomColor,
                                            ),
                                          ),
                                          child: Text(
                                            'GENERATE',
                                            style: TextStyle(
                                              color:  MyColors.Containers,

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
                      backgroundColor:   MyColors.myCustomColor,
                      child: Icon(
                        Icons.document_scanner_outlined,
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