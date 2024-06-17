
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../Utils/global.dart';
import '../Categories/Categories_Page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(
      Duration(seconds: 3),
          () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CategoriesPage(),));
      },
    );
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                  sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
              child: Image(
                image: AssetImage(Themes[18]['link']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Omg Quotes',
                  style: TextStyle(
                      fontSize: 55,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontName,
                      letterSpacing: 5),
                ),
              ),
              Center(
                child: Text(
                  '----------',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontName,
                      letterSpacing: 3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


