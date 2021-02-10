import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travlingapp/Common/colors.dart';
import 'package:travlingapp/Screen/openingscreen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds:10),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>  OpenningPage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:TravelAppColors.blue,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splashlogo.png',width: 110,height: 110,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('navana',style: TextStyle(
                  color: TravelAppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),),
                SizedBox(width: 10,),
                Text('air',style: TextStyle(
                 color:TravelAppColors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}