import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yr_nova/Scaner_App/On_BordQr/screen1_Q.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Scaner_App/SQFLITE&providers/DataBaseHelper.dart';
import 'Scaner_App/SQFLITE&providers/providers.dart';
import 'Scaner_App/Screens/NavBar.dart';


int? isViewed;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('Onbording');
  final dbHelper = DatabaseHelper();
  await dbHelper.initDatabase();
  print('isViewed: $isViewed');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFE2544A),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(),
      ),
      home: isViewed != 0 ? Onbording() : NavBar(),
    );
  }
}
