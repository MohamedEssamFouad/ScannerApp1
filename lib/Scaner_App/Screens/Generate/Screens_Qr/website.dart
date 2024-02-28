import 'package:flutter/material.dart';
import 'package:yr_nova/Scaner_App/SQFLITE&providers/QR_CodeData.dart';
import 'package:yr_nova/Scaner_App/SQFLITE&providers/providers.dart';

import '../../../Const/constss.dart';
import 'qr_result_page.dart';

import 'package:provider/provider.dart';
class website_q extends StatefulWidget {
  const website_q({Key? key}) : super(key: key);

  @override
  State<website_q> createState() => _WebsiteQState();
}

class _WebsiteQState extends State<website_q> {
  TextEditingController textEditingController = TextEditingController();



  String qrData = '';

  @override
  Widget build(BuildContext context) {
    final historyProvider=Provider.of<HistoryProvider>(context,listen: false);
    final double coverH = 40;
    final double profileH = 80;
    final top = coverH - profileH / 2;
    void setHttps() {
      if (!textEditingController.text.endsWith('https://')) {
        textEditingController.text += 'https://';
      }
    }
    void setWWW() {
      if (!textEditingController.text.endsWith('www.')) {
        textEditingController.text += 'www.';
      }
    }
    void setCom() {
      if (!textEditingController.text.endsWith('.com')) {
        textEditingController.text += '.com';
      }
    }


    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        backgroundColor: MyColors.myCustomColor,
        title: Text('Create Website QR Code'),
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
                                  keyboardType: TextInputType.url,
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Text',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: MyColors.myCustomColor),
                                  ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap:setHttps,
                                        child: Container(
                                          height: 25,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF3D0CC),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'https://',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: setWWW,
                                        child: Container(
                                          height: 25,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF3D0CC),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              'www.',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: setCom,
                                        child: Container(

                                          height: 25,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF3D0CC),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: Text(
                                              '.com',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                                          if (enteredText.isNotEmpty&&enteredText.endsWith('.com')) {
                                            setState(() {
                                              qrData = '$enteredText';
                                            });
                                            final qrcodeData=QrCodeData(qrData: qrData, timestamp: DateTime.now(),
                                                processName: 'website', iconIdentifier:'website' );
                                              historyProvider.addQrCode(qrcodeData);
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
                                                  content: Text('Text field is invalid. Please enter some text.'),
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
                      backgroundColor: Color(0xFF3C579A),
                      child: Icon(
                        Icons.cloud_circle,
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
