import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kucu/constants/const.dart';
import 'package:kucu/constants/loading.dart';
import 'package:kucu/tabs/searchbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LiveEvents extends StatefulWidget {
  @override
  _LiveEventsState createState() => _LiveEventsState();
}

class _LiveEventsState extends State<LiveEvents> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
          children: [
            Container(
             height: size.height* .40,
              decoration: BoxDecoration(
                color: Colors.indigo,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )
                // image: DecorationImage(
                //   image: AssetImage(" "),
                //   fit: BoxFit.fitWidth,
                // )
              ),
            ),
            SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02,),
                        Text("Dashboard",style: TextStyle(fontSize: 30,color: Colors.white, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Kenyatta University\n Christian Union",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        SizedBox(height: 5,),
                        SizedBox(
                          width: size.width *.6,//it just takes 60% of the width
                            child: Text(
                                "Develop Christian students who are well equipped to have Godly impact in a dynamic society"
                            ),
                        ),
                        SizedBox(
                          height: size.height* 0.14,
                          width: size.width* .5,   //it just takes 50% of the width
                            child: SearchBar()),
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            SeassionCard(
                              seassionNum: 1,
                              press: (){},
                            isDone: true,
                            ),SeassionCard1(
                              seassionNum: 2,
                              press: (){},
                            ),SeassionCard2(
                              seassionNum: 3,
                              press: (){},
                            ),SeassionCard3(
                              seassionNum: 4,
                              press: (){},
                            ),
                            SeassionCard4(
                              seassionNum: 5,
                              press: (){},
                            ),
                            SeassionCard5(
                              seassionNum: 6,
                              press: (){},
                            )
                          ],
                        ),
                        SizedBox(height:20),
                        Text("Activities",
                         style: Theme.of(context).textTheme.title
                         .copyWith(fontWeight: FontWeight.bold)
                         ),
                         Container(
                           margin: EdgeInsets.symmetric(vertical: 20),
                           padding: EdgeInsets.all(10),
                           height: 90,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(13),
                             boxShadow: [BoxShadow(offset: Offset(0,17),
                             blurRadius: 23,
                             spreadRadius: -13,
                             color: Colors.black,

                             )]
                           ),
                           child: Row(
                             children: [
                               Image(image: AssetImage("assets/KUCU LOGO.png")
                               ),
                               SizedBox(width: 20,),
                               Expanded(
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Topic",
                                   style: Theme.of(context).textTheme.subtitle,
                                   ),
                                   Text(" Your Subject here")
                               ],)),
                               Padding(padding: EdgeInsets.all(10),
                               //child: Icon(Icon.add),
                               )
                           ],
                           ),
                         ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.all(10),
                          height: 90,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                              boxShadow: [BoxShadow(offset: Offset(0,17),
                                blurRadius: 23,
                                spreadRadius: -13,
                                color: Colors.black,

                              )]
                          ),
                          child: Row(
                            children: [
                              Image(image: AssetImage("assets/KUCU LOGO.png")
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Topic",
                                        style: Theme.of(context).textTheme.subtitle,
                                      ),
                                      Text(" Your Subject here")
                                    ],)),
                              Padding(padding: EdgeInsets.all(10),
                                //child: Icon(Icon.add),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ],
        )
    );
  }
}

class SeassionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;
  final bool loading;

  final Future<void> launched;
  final String phoneNumber = "";
  final String  _launchUrl = 'https://www.facebook.com/kucumaincampus/';

  Future<void> _launchFacebook(String url) async{
    if (await canLaunch( _launchUrl)){
      await launch(_launchUrl,
      forceSafariVC: true,
          enableJavaScript: true,
        forceWebView: true,
          headers:<String, String>{'my_header_key' : 'my_header_value'}
      );
    }else{
      throw 'Could not launch $_launchUrl';
    }
  }

  const SeassionCard({
    Key key, this.seassionNum,
    this.isDone = false, this.press, this.launched, this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): LayoutBuilder(
      builder: (context, Constraint) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(13),
                  child: Container(
            width: Constraint.maxWidth/2 - 10,
            //padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [BoxShadow(offset: Offset(0,17),
              blurRadius: 23,
              spreadRadius: -13,
                color: Colors.black,
              )]
            ),
            child: Material(
              color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    _launchFacebook(_launchUrl);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                children: [
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                            color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Kbluecolor)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset("assets/icons/facebook.svg",),
                      )
                    ),
                    SizedBox(width: 10,),
                    Text("Facebook",style: Theme.of(context).textTheme.subtitle,)
                ],
              ),
                  ),
                        ),
            ),
          ),
        );
      }
    );
  }
}


class SeassionCard1 extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;

  final Future<void> launched;
  final String phoneNumber = "";
  final String  _launchUrl = 'https://kuchristianunion.org/';

  Future<void> _launchOurWebsite(String url) async{
    if (await canLaunch( _launchUrl)){
      await launch(_launchUrl,
          forceSafariVC: true,
          enableJavaScript: true,
          forceWebView: true,
          headers:<String, String>{'my_header_key' : 'my_header_value'}
      );
    }else{
      throw 'Could not launch $_launchUrl';
    }
  }

  const SeassionCard1({
    Key key, this.seassionNum,
    this.isDone = false, this.press, this.launched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, Constraint) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              width: Constraint.maxWidth/2 - 10,
              //padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [BoxShadow(offset: Offset(0,17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: Colors.black,
                  )]
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    _launchOurWebsite(_launchUrl);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 42,
                          width: 43,
                          decoration: BoxDecoration(
                              color: isDone ? Kbluecolor : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Kbluecolor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset("assets/icons/browser.svg",),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text("Our \nWebsite",style: Theme.of(context).textTheme.subtitle,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}

class SeassionCard2 extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;

  final Future<void> launched;
  final String  _launchUrl = 'https://www.youtube.com/channel/UCSdRsyPa_7SCP5zyJLwy3Cw';

  Future<void> _launchYoutube(String url) async{
    if (await canLaunch( _launchUrl)){
      await launch(_launchUrl,
          enableJavaScript: true,
          forceSafariVC: true,
          forceWebView: true,
          headers:<String, String>{'my_header_key' : 'my_header_value'}
      );
    }else{
      throw 'Could not launch $_launchUrl';
    }
  }


  const SeassionCard2({
    Key key, this.seassionNum,
    this.isDone = false, this.press, this.launched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, Constraint) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              width: Constraint.maxWidth/2 - 10,
              //padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [BoxShadow(offset: Offset(0,17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: Colors.black,
                  )]
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    _launchYoutube(_launchUrl);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 42,
                          width: 43,
                          decoration: BoxDecoration(
                              color: isDone ? Kbluecolor : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Kbluecolor)
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset("assets/icons/youtube.svg",),
                            )
                        ),
                        SizedBox(width: 10,),
                        Text("Youtube",style: Theme.of(context).textTheme.subtitle,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}

class SeassionCard3 extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;

  final Future<void> launched;
  final String phoneNumber = "";
  final String  _launchUrl = 'https://kucublog.wordpress.com/';

  Future<void> _launchKucuBlog(String url) async{
    if (await canLaunch( _launchUrl)){
      await launch(_launchUrl,
          forceSafariVC: true,
          enableJavaScript: true,
          forceWebView: true,
          headers:<String, String>{'my_header_key' : 'my_header_value'}
      );
    }else{
      throw 'Could not launch $_launchUrl';
    }
  }

  const SeassionCard3({
    Key key, this.seassionNum,
    this.isDone = false, this.press, this.launched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, Constraint) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              width: Constraint.maxWidth/2 - 10,
              //padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [BoxShadow(offset: Offset(0,17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: Colors.black,
                  )]
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    _launchKucuBlog(_launchUrl);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 42,
                          width: 43,
                          decoration: BoxDecoration(
                              color: isDone ? Kbluecolor : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Kbluecolor)
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset("assets/icons/wordpress.svg",),
                            )
                        ),
                        SizedBox(width: 10,),
                        Text("KUCU\nBlog",style: Theme.of(context).textTheme.subtitle,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}

class SeassionCard4 extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;

  const SeassionCard4({
    Key key, this.seassionNum,
    this.isDone = false, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, Constraint) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              width: Constraint.maxWidth/2 - 10,
              //padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [BoxShadow(offset: Offset(0,17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: Colors.black,
                  )]
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: press,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 42,
                          width: 43,
                          decoration: BoxDecoration(
                              color: isDone ? Kbluecolor : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Kbluecolor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset("assets/icons/twitter.svg",),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text("Twitter",style: Theme.of(context).textTheme.subtitle,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
class SeassionCard5 extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final Function press;

  const SeassionCard5({
    Key key, this.seassionNum,
    this.isDone = false, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, Constraint) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              width: Constraint.maxWidth/2 - 10,
              //padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [BoxShadow(offset: Offset(0,17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: Colors.black,
                  )]
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: press,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 42,
                          width: 43,
                          decoration: BoxDecoration(
                              color: isDone ? Kbluecolor : Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Kbluecolor)
                          ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset("assets/icons/instagram.svg",),
                            )
                        ),
                        SizedBox(width: 10,),
                        Text("Instagram",style: Theme.of(context).textTheme.subtitle,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}