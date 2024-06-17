import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qutoes_app/Screens/SettingPage/Setting_Page.dart';
import '../../Utils/global.dart';
import '../../main.dart';
import '../ChoiceTheme/Choice_Theme.dart';
import '../EditingPage/Editing_Page.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
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
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    //Tough Times
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tough Times',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 2,
                                fontFamily: fontName),
                          ),
                          Text('See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: fontName)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              CategoriesImageList['ToughTimes']!.length,
                              (index) => InkWell(
                                    onTap: () {
                                      CategoriesSelectedIndex = index;
                                      select = CategoriesImageList[
                                          'ToughTimes']![index]['text']!;
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10, left: 15),
                                      width: 175,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              opacity: 0.6,
                                              image: AssetImage(
                                                  CategoriesImageList[
                                                          'ToughTimes']![
                                                      index]['link']!),
                                              fit: BoxFit.cover)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${CategoriesImageList['ToughTimes']![index]['text']!}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontName,
                                            letterSpacing: 1.5),
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                    //Self Development
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Self Development',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: fontName,
                                letterSpacing: 2),
                          ),
                          Text('See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: fontName,
                                  letterSpacing: 1)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              CategoriesImageList['SelfDevelopment']!.length,
                              (index) => InkWell(
                                    onTap: () {
                                      CategoriesSelectedIndex = index;
                                      select = CategoriesImageList[
                                          'SelfDevelopment']![index]['text']!;
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10, left: 15),
                                      width: 175,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              opacity: 0.6,
                                              image: AssetImage(
                                                  CategoriesImageList[
                                                          'SelfDevelopment']![
                                                      index]['link']!),
                                              fit: BoxFit.cover)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${CategoriesImageList['SelfDevelopment']![index]['text']!}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontName,
                                            letterSpacing: 1.5),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                    // Religious And Spiritual
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Religious And Spiritual',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: fontName,
                                letterSpacing: 1.5),
                          ),
                          Text('See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: fontName,
                                  letterSpacing: 1.5)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              CategoriesImageList['ReligiousAndSpritual']!
                                  .length,
                              (index) => InkWell(
                                    onTap: () {
                                      CategoriesSelectedIndex = index;
                                      select = CategoriesImageList[
                                              'ReligiousAndSpritual']![index]
                                          ['text']!;
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10, left: 15),
                                      width: 175,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              opacity: 0.6,
                                              image: AssetImage(
                                                  CategoriesImageList[
                                                          'ReligiousAndSpritual']![
                                                      index]['link']!),
                                              fit: BoxFit.cover)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${CategoriesImageList['ReligiousAndSpritual']![index]['text']!}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontName,
                                            letterSpacing: 2),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                    // Love And Relationship
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Love And Relationship',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: fontName,
                                letterSpacing: 1.5),
                          ),
                          Text('See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: fontName,
                                  letterSpacing: 1)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              CategoriesImageList['LoveAndRelationship']!
                                  .length,
                              (index) => InkWell(
                                    onTap: () {
                                      CategoriesSelectedIndex = index;
                                      select = CategoriesImageList[
                                              'LoveAndRelationship']![index]
                                          ['text']!;
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10, left: 15),
                                      width: 175,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              opacity: 0.6,
                                              image: AssetImage(
                                                  CategoriesImageList[
                                                          'LoveAndRelationship']![
                                                      index]['link']!),
                                              fit: BoxFit.cover)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${CategoriesImageList['LoveAndRelationship']![index]['text']!}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontName,
                                            letterSpacing: 2),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                    // Motivation And Inspiration
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Motivation And Inspiration',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: fontName,
                                letterSpacing: 2),
                          ),
                          Text('See all',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 1.5,
                                fontFamily: fontName,
                              )),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              CategoriesImageList['MotivationAndInspiration']!
                                  .length,
                              (index) => InkWell(
                                    onTap: () {
                                      CategoriesSelectedIndex = index;
                                      select = CategoriesImageList[
                                              'MotivationAndInspiration']![
                                          index]['text']!;
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, top: 10, bottom: 10),
                                      width: 175,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              opacity: 0.6,
                                              image: AssetImage(
                                                  CategoriesImageList[
                                                          'MotivationAndInspiration']![
                                                      index]['link']!),
                                              fit: BoxFit.cover)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${CategoriesImageList['MotivationAndInspiration']![index]['text']!}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontName,
                                            letterSpacing: 2),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                    // Health And Fitness
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Health And Fitness',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: fontName,
                                letterSpacing: 2),
                          ),
                          Text('See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: fontName,
                                  letterSpacing: 1.5)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              CategoriesImageList['HealthAndFitness']!.length,
                              (index) => InkWell(
                                    onTap: () {
                                      CategoriesSelectedIndex = index;
                                      select = CategoriesImageList[
                                              'HealthAndFitness']![index]
                                          ['text']!;
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, top: 10, bottom: 10),
                                      width: 175,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              opacity: 0.6,
                                              image: AssetImage(
                                                  CategoriesImageList[
                                                          'HealthAndFitness']![
                                                      index]['link']!),
                                              fit: BoxFit.cover)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${CategoriesImageList['HealthAndFitness']![index]['text']!}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontName,
                                            letterSpacing: 2),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                    // Entrepreneurship
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Entrepreneurship',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: fontName,
                                letterSpacing: 2),
                          ),
                          Text('See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: fontName,
                                  fontSize: 20,
                                  letterSpacing: 1.5)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              CategoriesImageList['Entrepreneurship']!.length,
                              (index) => InkWell(
                                    onTap: () {
                                      CategoriesSelectedIndex = index;
                                      select = CategoriesImageList[
                                              'Entrepreneurship']![index]
                                          ['text']!;
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, top: 10, bottom: 10),
                                      width: 175,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              opacity: 0.6,
                                              image: AssetImage(
                                                  CategoriesImageList[
                                                          'Entrepreneurship']![
                                                      index]['link']!),
                                              fit: BoxFit.cover)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${CategoriesImageList['Entrepreneurship']![index]['text']!}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontName,
                                            letterSpacing: 2),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                    // Others
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Others',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 2,
                                fontFamily: fontName),
                          ),
                          Text('See all',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: fontName,
                                  letterSpacing: 1.5)),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                              CategoriesImageList['Others']!.length,
                              (index) => InkWell(
                                    onTap: () {
                                      CategoriesSelectedIndex = index;
                                      select = CategoriesImageList['Others']![
                                          index]['text']!;
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, top: 10, bottom: 10),
                                      width: 175,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5.0,
                                            ),
                                          ],
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              opacity: 0.6,
                                              image: AssetImage(
                                                  CategoriesImageList[
                                                          'Others']![index]
                                                      ['link']!),
                                              fit: BoxFit.cover)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${CategoriesImageList['Others']![index]['text']!}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: fontName,
                                            letterSpacing: 2),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            physics: const BouncingScrollPhysics(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, top: 50),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(CupertinoIcons.line_horizontal_3,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                height: 45,
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontName,
                      letterSpacing: 3),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15, top: 50),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingPage(),
                    ));
                  },
                  icon: const Icon(
                    CupertinoIcons.person,
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

int CategoriesSelectedIndex = 0;


