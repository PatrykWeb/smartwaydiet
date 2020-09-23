import 'package:flutter/material.dart';
import 'package:smartwaydiet/views/Home/home.dart';
import 'package:smartwaydiet/views/Training/training.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';


class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }

class _BottomBarState extends State<BottomBar> {

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Home(),
            Container(color: Colors.red,),
            Training(),
            Container(color: Colors.blue,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text('Home'),
            icon: Row(
              children: [
                Image.network("https://cdn.discordapp.com/attachments/473218411670011904/756145694783307886/home.png")
              ],
            ),
            activeColor: Colors.greenAccent[400]
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text('Item One'),
            icon: Row(
              children: [
                Image.network("https://cdn.discordapp.com/attachments/473218411670011904/756138030431076462/dish.png")
              ],
            ),
            activeColor: Colors.greenAccent[400]
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text('Trening'),
            icon: Row(
              children: [
                Image.network("https://cdn.discordapp.com/attachments/473218411670011904/756142779285110784/dumbbell.png")
              ],
            ),
            activeColor: Colors.greenAccent[400]
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text('Item One'),
            icon: Row(
              children: [
                Image.network("https://cdn.discordapp.com/attachments/473218411670011904/756137049764921444/body.png")
              ],
            ),
            activeColor: Colors.greenAccent[400]
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.center,
            title: Text('Item One'),
            icon: Icon(Icons.settings),
            activeColor: Colors.greenAccent[400]
          ),
        ],
      ),
    );
  }
}