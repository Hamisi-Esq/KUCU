import 'package:flutter/material.dart';

class LiveEvents extends StatefulWidget {
  @override
  _LiveEventsState createState() => _LiveEventsState();
}

class _LiveEventsState extends State<LiveEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _top(),
          SizedBox(height: 1.0,),
          Padding(padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category.",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                Text("View All",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0),)
              ],
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
              height: 200.0,
              child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3/2),
                children: [
                  _gridItem(Icons.settings),
                  _gridItem2(Icons.settings),
                  _gridItem3(Icons.settings),
                  _gridItem(Icons.settings),
                  _gridItem(Icons.settings),
                  _gridItem(Icons.settings),
                ],
              )
          ),
          Padding(padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text("Latest",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),

              ],
            ),
          ),
          _cardItem(1),
          _cardItem(2),
          _cardItem(3),
          _cardItem(4),
        ],
      ),
    );
  }
  _cardItem(images){
    return Padding(padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/bible.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(2.0)
            ),
          ),
          SizedBox(width: 20.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Item",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                ),
              ),
              SizedBox(height: 10.0,),
              Text("Item Details",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 5.0,),
              Text("data",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)
            ],
          )
        ],
      ),
    );
  }
  //The First Grid Item that is Facebook
  _gridItem(icon){
    return Column(
      children: [
        CircleAvatar(
          child: Icon(
            icon,size: 16.0,
            color: Colors.white,
          ),
          backgroundColor: Colors.indigo.withOpacity(0.9),
        ),
        SizedBox(height: 10.0,),
        Text(
          "Facebook",
          style: TextStyle(
              fontSize: 13.0
          ),
        )
      ],
    );
  }
  //The second Grid Item that is Instagram
  _gridItem2(icon){
    return Column(
      children: [
        CircleAvatar(
          child: Icon(
            icon,size: 16.0,
            color: Colors.white,
          ),
          backgroundColor: Colors.indigo.withOpacity(0.9),
        ),
        SizedBox(height: 10.0,),
        Text(
          "Youtube",
          style: TextStyle(
              fontSize: 13.0
          ),
        )
      ],
    );
  }
  _gridItem3(icon){
    return Column(
      children: [
        CircleAvatar(
          child: Icon(
            icon,size: 16.0,
            color: Colors.white,
          ),
          backgroundColor: Colors.indigo.withOpacity(0.9),
        ),
        SizedBox(height: 10.0,),
        Text(
          "Instagram",
          style: TextStyle(
              fontSize: 13.0
          ),
        )
      ],
    );
  }


  _top(){
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/KUCU LOGO.png"),
                  ),
                  SizedBox(width: 10.0,),
                  Text("Welcome to KUCU Dashboard.\n Preview Onging Events",style: TextStyle(color: Colors.white),)
                ],
              ),
              IconButton(
                  onPressed: null,
                  icon: Icon(Icons.notifications,color: Colors.white,)
              )
            ],
          ),
          SizedBox(height: 15.0,),
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: "Search",
          //     fillColor: Colors.white,
          //     filled: true,
          //     suffixIcon: Icon(Icons.filter_list),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(40.0),
          //       borderSide: BorderSide(color: Colors.transparent)
          //     ),
          //     contentPadding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0)
          //   ),
          // )

        ],
      ),
    );
  }
}
