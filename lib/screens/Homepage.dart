import 'package:flutter/material.dart';
import 'package:kucu/screens/home.dart';
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
    Center(child: Home()),
    Center(child: LiveEvents()),
    Center(child: Text("My Account")),
    Center(child: Text("Help")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
            icon: Icon(Icons.home,),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text("Dashboard",)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              title: Text("My account")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.help,),
              title: Text("Help",)
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: (index){
          setState(() {
            _currentindex= index;
          });
        },
      ),
    );
  }
}
