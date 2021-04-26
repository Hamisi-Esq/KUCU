import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:kucu/constants/const.dart';
import 'package:kucu/models/annual_activities.dart';
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
            SizedBox(height: 10,),
             // SizedBox(
            //   width: 242,
            //   height: 100,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(20),
            //       child: Image.asset(
            //         "assets/image1.jpg",
            //         fit: BoxFit.cover,
            //       ),
            //   ),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SpecialForyouCard(
                    image:("assets/image1.jpg"),
                    category: "Know more",
                    numofCards: 18,
                    press: (){},
                  ),
                   SpecialForyouCard(
                    image:("assets/image2.jpg"),
                    category: "Know more",
                    numofCards: 18,
                    press: (){},
                  ),
                   SpecialForyouCard(
                    image:("assets/image3.jpg"),
                    category: "Know more",
                    numofCards: 18,
                    press: (){},
                  ),
                   SpecialForyouCard(
                    image:("assets/image4.jpg"),
                    category: "Know more",
                    numofCards: 18,
                    press: (){},
                  ),
                   SpecialForyouCard(
                    image:("assets/image5.jpg"),
                    category: "Know more",
                    numofCards: 18,
                    press: (){},
                  ),
                  SizedBox(width: 20,)
                ],
              ),
            ),
            SizedBox(height: 8,),
            SectionTittle(text: "Annual Activities",
                press: (){}
            ),
            SizedBox(height: 5,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(demoProducts.length, (index) => AnnualActivitiesCard(
                    product: demoProducts[index],
                  ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}

class AnnualActivitiesCard extends StatelessWidget {
  const AnnualActivitiesCard({
    Key key, 
    this.width =120, 
    this.aspectRatio = 1.02, 
    @required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
            const SizedBox(height: 5,),
            Text(product.title,
            style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${demoProducts[0].price}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo
                ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      shape: BoxShape.circle,

                    ),
                    child:
                    SvgPicture.asset("assets/icons/star.svg"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SpecialForyouCard extends StatelessWidget {
  const SpecialForyouCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numofCards,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int  numofCards;
  final GestureTapCancelCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 240,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                width: 240,
                child: Image.asset(
                    image,
                  fit: BoxFit.cover,
                  ),
              ),
                Container(
                  width: 240,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,

                      colors:[
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                    ],
                    ),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan (
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                          TextSpan(text:"$numofCards Know More")
                      ],
                    ),
                  ),
                )
            ],
          ),
          ),
          ),
      ),
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
                  color: Colors.indigo.withOpacity(0.1),
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

