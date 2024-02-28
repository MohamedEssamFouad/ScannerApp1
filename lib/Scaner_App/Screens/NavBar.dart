

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Const/constss.dart';
import '../SQFLITE&providers/Favourittes.dart';
import '../SQFLITE&providers/HistoryPage.dart';

import 'Generate/GenerateSc.dart';
import 'Hstory.dart';
import 'ScanHome.dart';
import 'Settinngs.dart';



class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var tab_Index = 0;
  void changeTab(int index) {
    setState(() {
      tab_Index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tab_Index,
        children: [
          Generatee(),
          HistoryPage(),

          FavoritePage(),

          Sett(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,

          onTap: changeTab,
          selectedItemColor: MyColors.myCustomColor,
          unselectedItemColor: Colors.black,
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScanHome(),
            ),
          );
        },
        backgroundColor: Colors.deepOrange,
        child: Icon(
          Icons.document_scanner_rounded,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

BottomNavigationBarItem itemBar(IconData icon, String label, bool isSelected) {
  return BottomNavigationBarItem(
    icon: Icon(
      icon,
      size: 25,
      color: isSelected ? MyColors.myCustomColor : Colors.black,
    ),
    label: label,
  );
}