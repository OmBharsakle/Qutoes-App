import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Utils/global.dart';
import '../ChoiceTheme/Choice_Theme.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                  sigmaX: 15, sigmaY: 15, tileMode: TileMode.mirror),
              child: Image(
                image: AssetImage(Themes[ChoiceThemeIndex]['link']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: CarouselSlider.builder(
                  itemCount: Themes.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      InkWell(
                    onTap: () {
                      setState(() {
                        ChoiceThemeIndex = pageViewIndex;
                      });
                    },
                    child: Container(
                      width: 350,
                      margin: EdgeInsets.only(top: 110, bottom: 50),
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(Themes[itemIndex]['link']),
                            fit: BoxFit.cover),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Theme',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: fontName,
                            fontSize: 50),
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        ChoiceThemeIndex = index;
                      });
                    },
                    aspectRatio: 9 / 15,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Fonts',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        fontList.length,
                        (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  fontName = fontList[index]['font'];
                                  selectfont = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(6),
                                padding: EdgeInsets.only(
                                    top: 8, right: 10, left: 10, bottom: 8),
                                height: 40,
                                decoration: BoxDecoration(
                                    color: selectfont == index
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(
                                  fontList[index]['fName'],
                                  style: TextStyle(
                                    fontFamily: fontList[index]['font'],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: selectfont == index
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Music',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              10,
                              (index) => Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: CircleAvatar(
                                      radius: 35,
                                    ),
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 40),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    CupertinoIcons.back,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                height: 45,
                child: Text(
                  'Font & Music',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontName,
                      letterSpacing: 1.5),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, top: 40),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditPage(),
                    ));
                  },
                  icon: Icon(
                    CupertinoIcons.pen,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

int selectfont = 2;
