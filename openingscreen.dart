//Implimented concept of CarouselSlider the first pge of the app where user start booking

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travlingapp/Common/button.dart';
import 'package:travlingapp/Common/colors.dart';

class OpenningPage extends StatefulWidget {



  @override
  OpeningPageState createState() =>  OpeningPageState();
}

class OpeningPageState extends State<OpenningPage> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    //'https://image.shutterstock.com/z/stock-vector-woman-travel-alone-character-cartoon-of-woman-travel-woman-and-suitcase-abstract-nature-border-1424820401.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRJDH0ENuv5T5ol9rSmRiD495Swzp-ZPg5Vw&usqp=CAU',
    // 'https://st4.depositphotos.com/34034756/38902/v/950/depositphotos_389023924-stock-illustration-woman-man-suitcase-awaits-boarding.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQACf_-Ok1UfRPdJzjG_-6hd-tD5QgGT_mYfA&usqp=CAU',
    'https://previews.123rf.com/images/tigatelu/tigatelu1505/tigatelu150500170/40496698-cartoon-man-with-traveling-bag.jpg'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            carouselSlider = CarouselSlider(
              // height: 300.0,
              height: MediaQuery.of(context).size.height*0.6,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: TravelAppColors.white,
                      ),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.grey : TravelAppColors.pink,
                  ),
                );
              }
              ),
            ),
            SizedBox(
              height: 25.0,
            ),

            CustomButton(
             text: "START BOOKING",
              onPressed: () {
               },
            )
          ],
        ),
      ),
    );
  }
}