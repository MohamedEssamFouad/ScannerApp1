import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yr_nova/Scaner_App/SQFLITE&providers/providers.dart';
import '../Const/constss.dart';



class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {

    super.initState();

    Provider.of<HistoryProvider>(context, listen: false).loadFavoriteQrCodes();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final favoriteProvider = Provider.of<HistoryProvider>(context);
    final favoriteQrCodes = favoriteProvider.favoriteQrCodes;

    return Scaffold(
      backgroundColor: MyColors.scaffold,
      appBar: AppBar(
        backgroundColor: MyColors.myCustomColor,
        title: Text('Favorites'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: favoriteQrCodes.length,
          itemBuilder: (context, index) {
            final qrCode = favoriteQrCodes[index];
            final icon = qrCode.getIcon();
            final isFavorite = qrCode.isFavorite;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth > 600 ? 30 : 10,
                vertical: 10,
              ),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  color: MyColors.Containers,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Icon(icon, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${qrCode.processName}',
                              style: TextStyle(),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            SizedBox(height: 5),
                            Text('QR Data: ${qrCode.qrData}',style: TextStyle(overflow: TextOverflow.clip,),maxLines: 2,),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Icon(Icons.date_range, size: 20, color: MyColors.myCustomColor)),
                                      SizedBox(width: 6),
                                      Text(
                                        '${qrCode.formattedDate}',
                                        style: TextStyle(),
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(Icons.watch_later_outlined, size: 20, color: MyColors.myCustomColor),
                                      SizedBox(width: 10),
                                      Text('${qrCode.formattedTime}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () async {

                         await Provider.of<HistoryProvider>(context, listen: false).removeFavorite(qrCode);


                        },
                        icon: Icon(
                          Icons.star,
                          color: MyColors.myCustomColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
