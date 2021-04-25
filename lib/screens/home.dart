import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kucu/constants/const.dart';
import 'package:kucu/style/styling.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
             padding: EdgeInsets.all(8),
             width: double.infinity,
              height: 90,
              decoration: BoxDecoration(color: Colors.indigo,
              borderRadius: BorderRadius.circular(12)),
              child: Text.rich(
                TextSpan(
                  text: "Kenyatta University Christian Union\n ",
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: "Grow Spiritually",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    )
                  ]
                )
              ),
              ),
            SizedBox(height: 10,),
            Categories(),
            SizedBox(height: 8,),
            SectionTittle(
              text: "Special for you",
              press: (){},
            ),
            SizedBox(
              width: 242,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Image.asset(
                      "assets/image1.jpg",
                    fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors:[
                            Color(0xFF343434).withOpacity(0.4),
                            Color(0xFF343434).withOpacity(0.15),
                        ],
                        ),
                        ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan (
                            text: "More about us",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )
                            ),
                            TextSpan(text:"Know More")
                        ],
                      ),
                    )
                ],
              ),
              ),
              ),
          ],
        )
    );
  }
}

class SectionTittle extends StatelessWidget {
  const SectionTittle({
    Key key, 
    @required this.text, 
    @required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text("See More...")
            )
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories =[
      {"icon":"assets/icons/responsive.svg","text":"Register"},
      {"icon":"assets/icons/bible.svg","text":"Bible Study"},
      {"icon":"assets/icons/gift.svg","text":"Giving"},
      {"icon":"assets/icons/pdf.svg","text":"Pdf and Sermons"},
      {"icon":"assets/icons/album.svg","text":"Photos"}
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(categories.length, (index) => CategoryCard(icon: categories[index]["icon"],
          text: categories[index]["text"],
          press: (){},
          ),
          ),
        ]
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key, 
    @required this.icon, 
    @required this.text, 
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
          child: SizedBox(
        width: 55,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
            const SizedBox(height: 5,),
            Text(text,
            textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

