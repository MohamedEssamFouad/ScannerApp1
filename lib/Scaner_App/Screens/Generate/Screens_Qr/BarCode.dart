import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Const/constss.dart';
import 'bARCode/AZTEC.dart';
import 'bARCode/CODA.dart';
import 'bARCode/CODE128.dart';
import 'bARCode/CODE39.dart';
import 'bARCode/CODE93.dart';
import 'bARCode/DATAMAT.dart';
import 'bARCode/EAN.dart';
import 'bARCode/ISBN.dart';
import 'bARCode/ITF.dart';
import 'bARCode/PDF.dart';
import 'bARCode/UPCa.dart';
import 'bARCode/UPCe.dart';
import 'bARCode/ean13.dart';

class BarCODE extends StatelessWidget {

  final List<String> itemTitles = [
    'ISBN',
    'EAN 8',
    'EAN 13',
    'UPC E',
    'UPC A',
    'CODE 39',
    'CODE 93',
    'CODE 128',
    'ITF',
    'PDF 417',
    'CODABAR',
    'DATA MATRIX',
    'AZTEC',
  ];

  final List<Widget> screens = [
    ICBN(),
    EAN(),
    ean13(),
    UPCE(),
    UPCA(),
    CodeE39(),
    CodE93(),
    cODE128(),
    ITF(),
    PDF(),
    Coda(),
    dataMat(),
    AZTEC(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        title: Text('Generate QR'),
        backgroundColor: MyColors.myCustomColor,
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,

          ),
          itemCount: itemTitles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => screens[index],
                    ),
                  );
                },
                child: Padding(
                  padding: MyColors.customPadding,
                  child: Material(
                    elevation:1,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.document_scanner_outlined,
                        color: MyColors.myCustomColor,
                          ),

                          SizedBox(height: 8),
                          Text(itemTitles[index],style: TextStyle(
                            color: MyColors.textC,
                          ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            );
          },
        ),
      ),
    );
  }
}