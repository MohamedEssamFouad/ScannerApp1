import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../Const/constss.dart';
import '../SQFLITE&providers/Favourittes.dart';
import '../SQFLITE&providers/HistoryPage.dart';
import '../SQFLITE&providers/QR_CodeData.dart';
import '../SQFLITE&providers/providers.dart';

import 'Generate/GenerateSc.dart';
import 'Generate/Screens_Qr/RES_CAM.dart';

import 'Settinngs.dart';
import 'package:provider/provider.dart';
//import 'package:image_picker/image_picker.dart';
class ScanHome extends StatefulWidget {
  const ScanHome({Key? key}) : super(key: key);

  @override
  State<ScanHome> createState() => _ScanHomeState();
}

class _ScanHomeState extends State<ScanHome> {
  bool isScanCompleted = false;
  var tab_Index = 0;
  bool isFlashOn = false;
  bool isFrontCamera = false;
  MobileScannerController controller = MobileScannerController();
  late File _image;
  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  void dispose() {
    controller
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyProvider = Provider.of<HistoryProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(

        backgroundColor: MyColors.myCustomColor,
        title: Text('Scan'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            child: MobileScanner(
              controller: controller,
              allowDuplicates: true,
              onDetect: (barcode, args) {
                if (!isScanCompleted) {


                  String code = barcode.rawValue ?? '---';
                  isScanCompleted = true;
                  final qrCodeData = QrCodeData(

                    qrData: code,
                    timestamp: DateTime.now(), processName: 'Scanner', iconIdentifier: 'Scanner',
                  );

                  historyProvider.addQrCode(qrCodeData);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RES_CAM(
                          closeScreen: closeScreen,
                          code: code,
                        );
                      },
                    ),
                  ).then((_) {

                    isScanCompleted = false;
                  });
                }
              },
            ),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(50),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyColors.myCustomColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFlashOn = !isFlashOn;
                      });
                      controller.toggleTorch();
                    },
                    icon: Icon(

                        isFlashOn?  Icons.flash_on:Icons.flash_off, color: Colors.white),
                  ),


                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFrontCamera = !isFrontCamera;
                      });
                      controller.switchCamera();
                    },
                    icon: Icon(
                      isFrontCamera ? Icons.camera_alt : Icons.camera_front_rounded,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                     // pickImage();
                    },
                    icon: Icon(Icons.device_hub, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,

          onTap: (index) {

            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Generatee(),
                ),
              );
              // Navigate to the first screen
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryPage(),
                ),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePage(),
                ),
              );

            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Sett(),
                ),
              );
            }
          },
          items: [
            itemBar(
              Icons.add,
              '',
              tab_Index == 0,
            ),
            itemBar(
              Icons.history,
              '',
              tab_Index == 1,
            ),
            itemBar(
              Icons.star,
              '',
              tab_Index == 2,
            ),
            itemBar(
              Icons.settings,
              '',
              tab_Index == 3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.document_scanner_rounded,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem itemBar(
      IconData icon, String label, bool isSelected) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 25,
        color: isSelected ? MyColors.myCustomColor : Colors.black,
      ),
      label: label,
    );
  }
  //void pickImage() async {
   // var imagePicker = ImagePicker();
   // var image = await imagePicker.getImage(source: ImageSource.gallery);

  //  if (image != null) {
  //    setState(() {
  //      _image = File(image.path);
 //     });
  //  }
 // }
}


