import 'package:flutter/material.dart';
import 'package:kucu/screens/main_drawer.dart';
import 'package:kucu/screens/settings.dart';
import 'package:kucu/tabs/live_events.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentindex = 0;

  final tabs = [
    Center(child: Text("Home")),
    Center(child: LiveEvents()),
    Center(child: Text("My Account")),
    Center(child: Text("Help")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Home Page",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo,
        iconSize: 16,
        selectedFontSize: 13,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white,),
            title: Text("Home",style: TextStyle(color: Colors.white)),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.event,color: Colors.white),
              title: Text("Events",style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin,color: Colors.white),
              title: Text("My account",style: TextStyle(color: Colors.white))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.help,color: Colors.white),
              title: Text("Help",style: TextStyle(color: Colors.white),)
          ),
        ],
        onTap: (index){
          setState(() {
            _currentindex= index;
          });
        },
      ),
    );
  }
}
