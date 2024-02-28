import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yr_nova/Scaner_App/Screens/Generate/Screens_Qr/qr_result_page.dart';


import '../../../Const/constss.dart';
import '../../../SQFLITE&providers/QR_CodeData.dart';
import '../../../SQFLITE&providers/providers.dart';
import 'package:provider/provider.dart';
class locartion_Q extends StatefulWidget {
  const locartion_Q({Key? key}) : super(key: key);

  @override
  State<locartion_Q> createState() => _locartion_QState();
}

class _locartion_QState extends State<locartion_Q> {
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

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
        title: Text('Create Location QR Code'),
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
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  controller: latitudeController,
                                  decoration: InputDecoration(
                                    hintText: ' Enter Latitude Of location',
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: MyColors.myCustomColor),
                                    ),

                                  ),

                                ),
                                TextField(
                                  keyboardType: TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  controller: longitudeController,
                                  decoration: InputDecoration(
                                      hintText: 'Enter Longitude Of location',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: MyColors.myCustomColor),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(vertical: 40)
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
                                            latitudeController.clear();
                                            longitudeController.clear();
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
                                          final latitude =
                                              latitudeController.text;
                                          final longitude =
                                              longitudeController.text;
                                          if (latitude.isNotEmpty &&
                                              longitude.isNotEmpty) {
                                            setState(() {
                                              qrData = 'geo:<$latitude>,<$longitude>';
                                            });
                                            final qrCodeData = QrCodeData(
                                              qrData: qrData,
                                              timestamp: DateTime.now(), processName: 'location', iconIdentifier: 'location',
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
                                                  content: Text(
                                                      'Latitude and Longitude fields cannot be empty. Please enter both.'),
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
                      backgroundColor:         Color(0xFF4CB9AE),


                      child: Icon(
                        Icons.location_on,
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
