import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/global.dart';
import '../EditingPage/Editing_Page.dart';

class ChoiceTheme extends StatefulWidget {
  const ChoiceTheme({super.key});

  @override
  State<ChoiceTheme> createState() => _ChoiceThemeState();
}

class _ChoiceThemeState extends State<ChoiceTheme> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Choice Theme'),
      // ),
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
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GridView.builder(
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {});
                        ChoiceThemeIndex = index;
                        isRandom=true;
                      },
                      child: Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black,
                              blurRadius: 5.0,
                            ),
                          ],
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage(Themes[index]['link']),
                              fit: BoxFit.cover),
                        ),
                        child: (ChoiceThemeIndex == index)
                            ? Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.shade600, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black45,
                                ),
                                child: Icon(
                                  Icons.check_rounded,
                                  color: Colors.white,
                                ),
                              )
                            : Container(),
                      ),
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 9 / 16,
                    ),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: Themes.length,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 50),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    CupertinoIcons.back,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 45),
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  'Choice Theme',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontName,
                      letterSpacing: 1.5),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 15, top: 50),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditPage(),
                    ));
                  },
                  icon: Icon(CupertinoIcons.lightbulb,
                    size: 25,
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

int ChoiceThemeIndex = 18;
