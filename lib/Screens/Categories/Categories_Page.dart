import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';
import '../../Utils/global.dart';
import '../../quotes.dart';
import '../ChoiceTheme/Choice_Theme.dart';
import '../EditingPage/Editing_Page.dart';
import '../HomePage/Home_Page.dart';
import '../SettingPage/Setting_Page.dart';
import 'package:http/http.dart' as http;

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List? imageList;
  int? imageNumber = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImagesFromUnsplash();
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Stack(
              children: [
                isRandom?Container(
                  height: screenHeight,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage(Themes[ChoiceThemeIndex]['link']),
                          fit: BoxFit.cover)),
                  alignment: Alignment.center,
                ):imageList != null ?
                AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: BlurHash(
                    key: ValueKey(imageList![imageNumber!]['blur_hash']),
                    hash: imageList![imageNumber!]['blur_hash'],
                    duration: Duration(milliseconds: 500),
                    image: imageList![imageNumber!]['urls']['regular'],
                    curve: Curves.easeInOut,
                    imageFit: BoxFit.cover,
                  ),
                ):Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.black.withOpacity(0.6),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: SpinKitFadingCircle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: isRandom?Colors.black.withOpacity(0.4):Colors.black.withOpacity(0.6),
                ),
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: CarouselSlider.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(20),
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${quotes[select]![itemIndex]['quote'].toString()}",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white.withOpacity(0.95),
                              fontWeight: FontWeight.w600,fontFamily: fontName,
                            ),
                            textAlign: TextAlign.center,
                          ),
    isCategory?Text(
                                 "( ${select} )",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,fontFamily: fontName

                            ),
                            textAlign: TextAlign.center,
                          ):Container(),

                          isAuthor?Column(
                            children: [
                              Text(
                                "--------------------",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.6),
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,fontFamily: fontName

                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                 '- ${
                                      quotes[select]![itemIndex]['author']
                                          .toString()
                                    } -',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.6),
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,fontFamily: fontName

                                  )),
                            ],
                          ):Container(),
                        ],
                      ),
                    ),
                    options: CarouselOptions(
                      scrollDirection: Axis.vertical,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          copyIndex = index;
                          HapticFeedback.lightImpact();
                          imageNumber = index;
                        });
                      },
                    ),
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
                margin: const EdgeInsets.only(top: 50, left: 15),
                height: 45,
                child: Text(
                  'Omg Quotes ',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontName,
                      letterSpacing: 3),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, top: 50),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingPage(),
                    ));
                  },
                  icon: const Icon(
                    Icons.person_2_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
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
          Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 100,
                    child: Center(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: 80.0, right: 80, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {

                                    Navigator.of(context).pop();
                                    showModalBottomSheet<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                      return  Container(
                                        height: 140,
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10,),
                                            TextButton(onPressed: () {
                                              _shareLocalOnlyImage();
                                            }, child: Text('Share Image',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),),
                                            Divider(),
                                            TextButton(onPressed: () {
                                              _shareLocalImage(quotes[select]![copyIndex]
                                              ['quote']
                                                  .toString());
                                            }, child: Text('Share With Text',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),),
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                  icon: Icon(Icons.share)),
                              Text('Share'),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                      msg: 'Text Copied',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 16,
                                    );
                                    Clipboard.setData(
                                      new ClipboardData(
                                          text: quotes[select]![copyIndex]
                                                  ['quote']
                                              .toString()),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.copy)),
                              Text('Copy'),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    // _saveLocalImage();
                                    Navigator.of(context).pop();
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return  Container(
                                          height: 200,
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 10,),
                                              TextButton(onPressed: () {
                                                _saveLocalImageHD();
                                                Fluttertoast.showToast(
                                                  msg: 'Download Successfully',
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 2,
                                                  backgroundColor: Colors.black54,
                                                  textColor: Colors.white,
                                                  fontSize: 16,
                                                );
                                                Navigator.of(context).pop();
                                              }, child: Text('HD',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),),
                                              Divider(),
                                              TextButton(onPressed: () {
                                                _saveLocalImage4k();
                                                Fluttertoast.showToast(
                                                  msg: 'Download Successfully',
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 2,
                                                  backgroundColor: Colors.black54,
                                                  textColor: Colors.white,
                                                  fontSize: 16,
                                                );
                                                Navigator.of(context).pop();
                                              }, child: Text('FHD',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),),
                                              Divider(),
                                              TextButton(onPressed: () {
                                                _saveLocalImage();
                                                Fluttertoast.showToast(
                                                  msg: 'Download Successfully',
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 2,
                                                  backgroundColor: Colors.black54,
                                                  textColor: Colors.white,
                                                  fontSize: 16,
                                                );
                                                Navigator.of(context).pop();
                                              }, child: Text('Normal',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),),
                                              // Divider(),
                                              // TextButton(onPressed: () {
                                              //   _saveLocalImage();
                                              //   Fluttertoast.showToast(
                                              //     msg: 'Download Successfully',
                                              //     toastLength: Toast.LENGTH_SHORT,
                                              //     gravity: ToastGravity.BOTTOM,
                                              //     timeInSecForIosWeb: 2,
                                              //     backgroundColor: Colors.black54,
                                              //     textColor: Colors.white,
                                              //     fontSize: 16,
                                              //   );
                                              //   Navigator.of(context).pop();
                                              // }, child: Text('Custom',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),),),
                                            ],
                                          ),
                                        );
                                      },
                                    );


                                  },
                                  icon: Icon(Icons.download_rounded)),
                              Text('Download'),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    Fluttertoast.showToast(
                                      msg: 'Wallpaper Set Successfully',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                      fontSize: 16,
                                    );
                                    captureAndSetWallpaper();
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.wallpaper_rounded)),
                              Text('Wallpaper'),
                            ],
                          ),
                        ],
                      ),
                    )),
                  );
                },
              );
            },
            child: Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 350, right: 15),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Icon(
                  Icons.tune_rounded,
                  color: Colors.white,
                )),
          ),
          SpeedDialFabWidget(
            secondaryIconsList: [
              Icons.edit,
              Icons.wallpaper_rounded,
              Icons.category_rounded,
              Icons.person,
              Icons.refresh_rounded,
            ],
            secondaryIconsText: [
              "Edit",
              "Themes",
              "Categories",
              "Author Name",
              isRandom? 'Random Images' : 'Theme Image',
            ],
            secondaryIconsOnPress: [
              () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditPage(),
                    ))
                  },
              () => {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChoiceTheme(),
                    ))
                  },
              () => {
                Fluttertoast.showToast(
                  msg: isCategory?'Hide Categories':'Show Categories',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16,
                ),
                isCategory=!isCategory
                  },
              () => {
                Fluttertoast.showToast(
                  msg: isAuthor ?'Hide Author Name':'Show Author Name' ,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16,
                ),
                isAuthor=!isAuthor
                  },
              () => {
                Fluttertoast.showToast(
                  msg: isRandom? 'Random Images' : 'Theme Image',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16,
                ),
                isRandom = !isRandom,
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

  void getImagesFromUnsplash() async {
    var url =
        'https://api.unsplash.com/search/photos?per_page=30&query=nature&order_by=relevant&client_id=BEI2ELJXRcv2lBZO6D7C_wmaJtgSLqXD6k39aC79C1k';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    print(response.statusCode);
    var unsplashData = json.decode(response.body);
    imageList = unsplashData['results'];
    setState(() {});
  }
}

var copyIndex;

GlobalKey _globalKey = GlobalKey();

_saveLocalImage() async {
  RenderRepaintBoundary boundary =
  _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 1.0);
  ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
  await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
}

_saveLocalImageHD() async {
  RenderRepaintBoundary boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 2.0);
  ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
  await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
}

_saveLocalImage4k() async {
  RenderRepaintBoundary boundary =
  _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage(pixelRatio: 5.0);
  ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
  await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
}

_shareLocalImage(String extraText) async {
  RenderRepaintBoundary boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image imageUi = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await imageUi.toByteData(format: ui.ImageByteFormat.png);
  Uint8List img = byteData!.buffer.asUint8List();
  final path = await getApplicationCacheDirectory();
  File file = File("${path.path}/img.png");
  file.writeAsBytes(img);
  ShareExtend.share(file.path, "image",extraText: extraText);
}

_shareLocalOnlyImage() async {
  RenderRepaintBoundary boundary =
  _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image imageUi = await boundary.toImage(pixelRatio: 3.0);
  ByteData? byteData = await imageUi.toByteData(format: ui.ImageByteFormat.png);
  Uint8List img = byteData!.buffer.asUint8List();
  final path = await getApplicationCacheDirectory();
  File file = File("${path.path}/img.png");
  file.writeAsBytes(img);
  ShareExtend.share(file.path, "image");
}

captureAndSetWallpaper() async {
    RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image imageUi = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await imageUi.toByteData(format: ui.ImageByteFormat.png);
    Uint8List img = byteData!.buffer.asUint8List();
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/img.png';
    File file = File(path);
    await file.writeAsBytes(img);
    int location = WallpaperManager.HOME_SCREEN;
    bool result = await WallpaperManager
        .setWallpaperFromFile(
        file.path, location);
}
