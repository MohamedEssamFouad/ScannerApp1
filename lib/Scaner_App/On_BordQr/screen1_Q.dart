import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Const/constss.dart';
import '../Screens/Generate/GenerateSc.dart';
import '../Screens/NavBar.dart';

class Content {
  final String title;
  final String description;

  Content(this.title, this.description);
}

class Onbording extends StatefulWidget {

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  List<Content> contents = [
    Content('Scan QR code &Bar Code', 'Description 1'),
    Content('Create QR Code', 'Description 2'),
    Content('Share to your friends', 'Description 3'),
  ];
_storeBoard()async{
  int isviewed=0;
  SharedPreferences prefs=await SharedPreferences.getInstance();
  await prefs.setInt('Onbording', isviewed);
}
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: MyColors.Containers,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          if (currentIndex < contents.length - 1)
            TextButton(
              onPressed: ()async {
                await _storeBoard();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NavBar(),
                  ),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.black),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://blog.vantagecircle.com/content/images/2020/07/welcome-messages-for-employees.png'),
                      ),
                      Text(
                        contents[index].title,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(

                contents.length,
                    (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: ElevatedButton(
                onPressed: ()async {
                  if (currentIndex == contents.length - 1) {
                    await _storeBoard();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NavBar(),
                      ),
                    );
                  }
                  _controller.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.myCustomColor,
                ),
                child: Text(
                  currentIndex == contents.length - 1 ? "Get Started" : "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 35 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:currentIndex==index? MyColors.myCustomColor:Colors.grey,
      ),
    );
  }
}
