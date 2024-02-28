import 'package:flutter/material.dart';
import 'package:yr_nova/Scaner_App/Const/constss.dart';
import 'package:yr_nova/Scaner_App/SQFLITE&providers/providers.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  @override
  void initState() {
    super.initState();
    print('Initializing HistoryPage');
    Provider.of<HistoryProvider>(context, listen: false).loadQrCodes();

  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final historyProvider = Provider.of<HistoryProvider>(context);
    final qrCodes = historyProvider.qrCodes;

    return Scaffold(

      backgroundColor: MyColors.scaffold,
      appBar: AppBar(

        backgroundColor: MyColors.myCustomColor,
        title: Text('History'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: qrCodes.length,
          itemBuilder: (context, index) {
            final qrCode = qrCodes[index];
            final icon = qrCode.getIcon();
            var isFavorite = qrCode.isFavorite;
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MyColors.Containers,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Icon(icon, color: Colors.white, size: 24),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${qrCode.processName}',
                          style: TextStyle(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: 5),
                        Text('QR Data: ${qrCode.qrData}'),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.date_range, size: 20, color: MyColors.myCustomColor),
                                  //SizedBox(width: 1),
                                  Text(
                                    '${qrCode.formattedDate}',
                                    style: TextStyle(),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            //SizedBox(width: 4),
                           // Spacer(),
                            Row(
                              children: [
                                Icon(Icons.watch_later_outlined, size: 20, color: MyColors.myCustomColor),
                             //   SizedBox(width: 1),
                                Text('${qrCode.formattedTime}'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final historyProvider = Provider.of<HistoryProvider>(context, listen: false);

                      if (isFavorite ) {
                        setState(() {
                          qrCodes[index].isFavorite=false;
                        });

                        historyProvider.removeFavorite(qrCode);
                      } else {
                              setState(() {
                                qrCodes[index].isFavorite=true;

                              });
                        if (!historyProvider.favoriteQrCodes.contains(qrCode)) {
                          historyProvider.addFavorite(qrCode);
                        }
                      }
                    },
                    icon: Icon(
                      qrCodes[index].isFavorite ? Icons.star : Icons.star_border,
                      color: MyColors.myCustomColor,
                    ),
                  ),

                  IconButton(

                    onPressed: () async {
                      final historyProvider = Provider.of<HistoryProvider>(context, listen: false);


                      bool confirmDelete = await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Confirm Deletion"),
                            content: Text("Are you sure you want to delete this QR code?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false); // Cancel deletion
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true); // Confirm deletion
                                },
                                child: Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirmDelete == true) {

                        await historyProvider.removeQR(qrCode);
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      color: MyColors.myCustomColor,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
