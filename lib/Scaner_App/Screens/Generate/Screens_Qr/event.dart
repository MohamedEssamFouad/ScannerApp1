import 'package:flutter/material.dart';
import 'package:yr_nova/Scaner_App/Screens/Generate/Screens_Qr/qr_result_page.dart';
import 'package:provider/provider.dart';

import '../../../Const/constss.dart';
import '../../../SQFLITE&providers/QR_CodeData.dart';
import '../../../SQFLITE&providers/providers.dart';

class event_q extends StatefulWidget {
  const event_q({Key? key}) : super(key: key);

  @override
  State<event_q> createState() => _event_qState();
}

class _event_qState extends State<event_q> {
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  bool isSwitched = false;
  String qrData = '';

  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? startDate ?? DateTime.now() : endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext,Widget? child){
        return Theme(data: ThemeData.light().copyWith(
          primaryColor: MyColors.myCustomColor,
          cardColor: MyColors.myCustomColor,
          hintColor: Colors.green,
        ), child: child!);
      }
    );

    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          startDate = pickedDate;
        } else {
          endDate = pickedDate;
        }
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.toLocal()}".split(' ')[0];
  }

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double coverH = 40;
    final double profileH = 80;
    final top = coverH - profileH / 2;

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
        title: Text('Create Event QR Code'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: [
                          Container(
                            height: 500,
                            decoration: BoxDecoration(
                              color: MyColors.Containers,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 25,
                              ),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: titleController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Event title',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: MyColors.myCustomColor,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 25,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('All Day Event'),
                                      Switch(
                                        activeTrackColor: Color(0xFFF2A8A7),
                                        activeColor: MyColors.myCustomColor,
                                        value: isSwitched,
                                        onChanged: (val) {
                                          setState(() {
                                            isSwitched = val;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  TextField(
                                    onTap: () {
                                      _selectDate(context, true);
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: 'Start Date',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: MyColors.myCustomColor,
                                        ),
                                      ),
                                    ),
                                    controller: TextEditingController(
                                      text: formatDate(startDate),
                                    ),
                                  ),
                                  TextField(
                                    onTap: () {
                                      _selectDate(context, false);
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: 'End Date',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: MyColors.myCustomColor,
                                        ),
                                      ),
                                    ),
                                    controller: TextEditingController(
                                      text: formatDate(endDate),
                                    ),
                                  ),
                                  TextField(
                                    controller: locationController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Event Location',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: MyColors.myCustomColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextField(
                                    controller: contentController,
                                    decoration: InputDecoration(
                                      hintText: 'Please Enter Content',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: MyColors.myCustomColor,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 45,
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
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: MyColors.myCustomColor,
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              titleController.clear();
                                              locationController.clear();
                                              contentController.clear();
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
                                            final title = titleController.text;
                                            final location = locationController.text;
                                            final content = contentController.text;

                                            if (title.isNotEmpty&& startDate != null && endDate != null) {
                                              setState(() {
                                                qrData = 'Event\n$title\n${formatDate(startDate)}\n${formatDate(endDate)}\n$location\n$content\n';
                                              });
                                              final qrCodeData = QrCodeData(
                                                qrData: qrData,
                                                timestamp: DateTime.now(), processName: 'Call', iconIdentifier: 'call',
                                              );

                                              final historyProvider = Provider.of<HistoryProvider>(context, listen: false).addQrCode(qrCodeData);

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
                                                        'Title field is empty. Please enter an event title and start date and end date.'),
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
                        backgroundColor: Color(0xFFDF703B),
                        child: Icon(
                          Icons.event,
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
