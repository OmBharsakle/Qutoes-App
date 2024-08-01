import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qutoes_app/Screens/HomePage/Home_Page.dart';

import '../../Utils/global.dart';
import '../ChoiceTheme/Choice_Theme.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentSongIndex = -1;
  bool _isPlaying = false;

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
                      Container(
                        width: 350,
                        margin: EdgeInsets.only(top: 110, bottom: 50),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
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
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        ChoiceThemeIndex = index;
                        isRandom = true;
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
                              Songs.length,
                                  (index) => GestureDetector(
                                onTap: () async {
                                  await _togglePlayPause(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                    AssetImage(Themes[index]['link']),
                                    child: Icon(
                                      _currentSongIndex == index && _isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                  ),
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
                margin: EdgeInsets.only(top: 50),
                height: 40,
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
                margin: EdgeInsets.only(right: 15, top: 50),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black45, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  },
                  icon: Icon(
                    Icons.category_outlined,
                    size: 23,
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

  Future<void> _togglePlayPause(int index) async {
    if (_currentSongIndex == index) {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
    } else {
      if (_currentSongIndex != -1) {
        await _audioPlayer.stop();
      }
      await _audioPlayer.play(AssetSource(Songs[index]));
    }
    setState(() {
      _currentSongIndex = index;
      _isPlaying = !_isPlaying;
    });
  }
}


int selectfont = 2;

