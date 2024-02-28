import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yr_nova/Scaner_App/SQFLITE&providers/QR_CodeData.dart';
import 'package:yr_nova/Scaner_App/Screens/Generate/Screens_Qr/qr_result_page.dart';

import '../../../Const/constss.dart';
import 'package:provider/provider.dart';

import '../../../SQFLITE&providers/providers.dart';

class email_q extends StatefulWidget {
  const email_q({Key? key}) : super(key: key);

  @override
  State<email_q> createState() => _email_qState();
}

class _email_qState extends State<email_q> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  String qrData = '';

  bool isValidEmail(String email) {

    final RegExp emailRegex =
    RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

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
        title: Text('Create Email QR Code'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: [
                          Container(
                            height: 340,
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
                                    keyboardType: TextInputType.emailAddress,
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      hintText: 'Please Enter Email Address',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 25),
                                    ),
                                  ),
                                  TextField(
                                    controller: textEditingController2,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Please Enter Subject',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 25),
                                    ),
                                  ),
                                  TextField(
                                    controller: textEditingController3,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Please Enter Content',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 35),
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
                                            onPressed: () {
                                              textEditingController.clear();
                                              textEditingController2.clear();
                                              textEditingController3.clear();

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
                                            final enteredText =
                                                textEditingController.text;
                                            final enteredText2 =
                                                textEditingController2.text;
                                            final enteredText3 =
                                                textEditingController3.text;

                                            if (isValidEmail(enteredText)) {
                                              setState(() {
                                                qrData =
                                                'Email\n$enteredText\n$enteredText2\n$enteredText3\n';
                                              });
                                              final qrCodeData = QrCodeData(
                                                qrData: qrData,
                                                timestamp: DateTime.now(),
                                                processName: 'Email',
                                                iconIdentifier: 'email',
                                              );
                                              historyProvider.addQrCode(
                                                  qrCodeData);

                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      QrResultPage(
                                                          qrData: qrData),
                                                ),
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Invalid Email'),
                                                    content: Text(
                                                        'Please enter a valid email address.'),
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
                                              BorderRadius.circular(15),
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
                        backgroundColor: Color(0xFFB15B9C),
                        child: Icon(
                          Icons.email,
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
