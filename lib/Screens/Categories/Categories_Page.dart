import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';
import '../../Utils/global.dart';
import '../../quotes.dart';
import '../ChoiceTheme/Choice_Theme.dart';
import '../EditingPage/Editing_Page.dart';
import '../HomePage/Home_Page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      opacity: 0.8,
                      image: AssetImage(Themes[ChoiceThemeIndex]['link']),
                      fit: BoxFit.cover)),
              alignment: Alignment.center,
              child: CarouselSlider.builder(
                itemCount: 10,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(5),
                  // color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        quotes[select]![itemIndex]['quote'].toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: fontName),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "--------------------",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(quotes[select]![itemIndex]['author'].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: fontName,
                              fontSize: 18)),
                    ],
                  ),
                ),
                options: CarouselOptions(
                  height: 1080,
                  scrollDirection: Axis.vertical,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      copyIndex = index;
                      print(copyIndex);
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
            },
            child: Container(
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 350, left: 30),
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.category_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: fontName,
                        letterSpacing: 1.5),
                  )
                ],
              ),
            ),
          ),
          SpeedDialFabWidget(
            secondaryIconsList: [
              Icons.wallpaper_rounded,
              Icons.share_rounded,
              Icons.content_paste,
              Icons.save,
              Icons.edit,
            ],
            secondaryIconsText: [
              "Themes",
              "Share",
              "Copy",
              "Save",
              "Edit",
            ],
            secondaryIconsOnPress: [
              () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoiceTheme(),
                    ))
                  },
              () => {_shareLocalImage()},
              () => {
                    Clipboard.setData(
                      new ClipboardData(
                          text: quotes[select]![copyIndex]['quote'].toString()),
                    ),
                  },
              () => {_saveLocalImage()},
              () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditPage(),
                    ))
                  },
            ],
            secondaryBackgroundColor: Colors.black38,
            secondaryForegroundColor: Colors.grey.shade200,
            primaryBackgroundColor: Colors.black38,
            primaryForegroundColor: Colors.grey.shade100,
          ),
        ],
      ),
    );
  }
}

var copyIndex;

GlobalKey _globalKey = GlobalKey();

_saveLocalImage() async {
  RenderRepaintBoundary boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage();
  ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
  await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
}

_shareLocalImage() async {
  RenderRepaintBoundary boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage();
  ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
  await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
  final path = getApplicationCacheDirectory();
  File file = File("$path/img.png");
  ShareExtend.share(file.path, "image");
}
