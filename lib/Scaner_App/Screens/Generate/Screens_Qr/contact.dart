import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yr_nova/Scaner_App/Screens/Generate/Screens_Qr/qr_result_page.dart';
import '../../../SQFLITE&providers/providers.dart';
import '../../../Const/constss.dart';
import '../../../SQFLITE&providers/QR_CodeData.dart';
import 'package:provider/provider.dart';

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  TextEditingController textEditingController7 = TextEditingController();
  TextEditingController textEditingController8 = TextEditingController();
  TextEditingController textEditingController9 = TextEditingController();
  TextEditingController textEditingController10 = TextEditingController();

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.contact_page_outlined,
            ),
          )
        ],
        backgroundColor: MyColors.myCustomColor,
        title: Text('Create Contact QR Code'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: [
                          Container(
                            height: 800,
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
                                    controller: textEditingController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: 'Enter First Name',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 25),
                                    ),
                                  ),
                                  TextField(
                                    controller: textEditingController2,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Last Name',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 25),
                                    ),
                                  ),
                                  TextField(
                                    controller: textEditingController3,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Organization',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 35),
                                    ),
                                  ),
                                  TextField(
                                    controller: textEditingController4,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Phone Number',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 25),
                                    ),
                                  ),
                                  TextField(
                                    controller: textEditingController5,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Email Address',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 25),
                                    ),
                                  ),
                                  TextField(
                                    controller: textEditingController6,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Street Address',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 35),
                                    ),
                                  ),
                                  TextField(
                                    controller: textEditingController7,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Enter City',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: MyColors.myCustomColor),
                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 35),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 125,
                                        child: TextField(
                                          controller: textEditingController8,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Country',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(color: MyColors.myCustomColor),
                                            ),
                                            contentPadding:
                                            EdgeInsets.symmetric(vertical: 35),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width: 125,
                                        child: TextField(
                                          controller: textEditingController9,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Zip Code',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                              BorderSide(color: MyColors.myCustomColor),
                                            ),
                                            contentPadding:
                                            EdgeInsets.symmetric(vertical: 35),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextField(
                                    controller: textEditingController10,
                                    keyboardType: TextInputType.url,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Website URL',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: MyColors.myCustomColor),
                                      ),
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
                                              textEditingController4.clear();
                                              textEditingController5.clear();
                                              textEditingController6.clear();
                                              textEditingController7.clear();
                                              textEditingController8.clear();
                                              textEditingController9.clear();
                                              textEditingController10.clear();
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
                                            final enteredText4 =
                                                textEditingController4.text;
                                            final enteredText5 =
                                                textEditingController5.text;
                                            final enteredText6 =
                                                textEditingController6.text;
                                            final enteredText7 =
                                                textEditingController7.text;
                                            final enteredText8 =
                                                textEditingController8.text;
                                            final enteredText9 =
                                                textEditingController9.text;
                                            final enteredText10 =
                                                textEditingController10.text;
                                            if (enteredText.isNotEmpty) {
                                              setState(() {
                                                qrData =
                                                'BEGIN:VCARD\nN:$enteredText;$enteredText2;\nTEL;TYPE=work,VOICE:$enteredText4\nEMAIL:$enteredText5\nORG:$enteredText3\nADR;TYPE=WORK,PREF:;;$enteredText6;$enteredText7;$enteredText8;$enteredText9\nURL:$enteredText10\nVERSION:3.0\nEND:VCARD';
                                              });

                                              final qrCodeData = QrCodeData(
                                                qrData: qrData,
                                                timestamp: DateTime.now(),
                                                processName: 'Contact',
                                                iconIdentifier: 'contact',
                                              );

                                              historyProvider.addQrCode(qrCodeData);

                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      QrResultPage(qrData: qrData),
                                                ),
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
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
                        backgroundColor: Color(0xFF4786C9),
                        child: Icon(
                          Icons.person,
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
