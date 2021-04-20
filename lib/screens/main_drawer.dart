import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kucu/screens/settings.dart';

class MainDrawer extends StatelessWidget {
  //static const routeName = '/settings';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30,bottom: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(image: AssetImage("assets/KUCU LOGO.png"),
                      //fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Text("Kenyatta University Christian Union",style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text("info@kuchristianunion.org",style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person,color: Colors.indigo),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.home,color: Colors.indigo),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.indigo),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: (){
              //Navigator.of(context).pushNamed(Settings().routeName);
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Settings()));
            },
          ),
          ListTile(
            leading: Icon(Icons.more,color: Colors.indigo),
            title: Text(
              'About Us',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.indigo),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
