// import 'dart:convert';
// import 'dart:io';
// import 'dart:ui';
// import 'dart:ui' as ui;
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_blurhash/flutter_blurhash.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:speed_dial_fab/speed_dial_fab.dart';
// import '../../Utils/global.dart';
// import '../../quotes.dart';
// import '../ChoiceTheme/Choice_Theme.dart';
// import '../HomePage/Home_Page.dart';
// import '../SettingPage/Setting_Page.dart';
//
// class RamdomQuotes extends StatefulWidget {
//   const RamdomQuotes({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<RamdomQuotes> {
//   List? imageList;
//   int? imageNumber = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getImagesFromUnsplash();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         body:
//         imageList != null ?
//         Stack(
//           children: [
//             RepaintBoundary(
//               key: _globalKey,
//               child: Stack(
//                 children: [
//                   AnimatedSwitcher(
//                     duration: Duration(seconds: 1),
//                     child: BlurHash(
//                       key: ValueKey(imageList![imageNumber!]['blur_hash']),
//                       hash: imageList![imageNumber!]['blur_hash'],
//                       duration: Duration(milliseconds: 500),
//                       image: imageList![imageNumber!]['urls']['regular'],
//                       curve: Curves.easeInOut,
//                       imageFit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: width,
//                     height: height,
//                     color: Colors.black.withOpacity(0.6),
//                   ),
//                   Container(
//                     width: width,
//                     height: height,
//                     child: SafeArea(
//                       child: CarouselSlider.builder(
//                         itemCount: quotesList.length,
//                         itemBuilder: (context, index1, index2){
//                           return Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                                 child: Text(quotesList[index1][kQuote], style: ,
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               SizedBox(height: 10,),
//                               Text('- ${quotesList[index1][kAuthor]} -', style: ,
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           );
//                         },
//                         options: CarouselOptions(
//                             scrollDirection: Axis.vertical,
//                             pageSnapping: true,
//                             initialPage: 0,
//                             enlargeCenterPage: true,
//                             onPageChanged: (index, value){
//                               HapticFeedback.lightImpact();
//                               imageNumber = index;
//                               setState(() {
//
//                               });
//                             }
//                         ),
//                       ),
//                     ),
//
//
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(top: 50, left: 15),
//                   height: 45,
//                   child: Text(
//                     'Omg Quotes ',
//                     style: TextStyle(
//                         fontSize: 25,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontFamily: fontName,
//                         letterSpacing: 3),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 10, top: 50),
//                   width: 40,
//                   height: 40,
//                   decoration: const BoxDecoration(
//                     color: Colors.black45,
//                     borderRadius: BorderRadius.all(Radius.circular(50)),
//                   ),
//                   alignment: Alignment.center,
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const SettingPage(),
//                       ));
//                     },
//                     icon: const Icon(
//                       Icons.person_2_rounded,
//                       size: 25,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//           ],
//         )
//             : Container(
//           width: width,
//           height: height,
//           color: Colors.black.withOpacity(0.6),
//           child: Container(
//             width: 100,
//             height: 100,
//             child: SpinKitFadingCircle(
//               color: Colors.white,
//             ),
//           ),
//         ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => HomeScreen(),
//               ));
//             },
//             child: Container(
//               height: 55,
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               margin: EdgeInsets.only(top: 350, left: 30),
//               decoration: BoxDecoration(
//                   color: Colors.black38,
//                   borderRadius: BorderRadius.circular(15)),
//               alignment: Alignment.center,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.category_rounded,
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     'Categories',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontFamily: fontName,
//                         letterSpacing: 1.5),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               showModalBottomSheet<void>(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return Container(
//                     height: 100,
//                     child: Center(
//                         child: Padding(
//                           padding:
//                           const EdgeInsets.only(left: 80.0, right: 80, top: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 children: [
//                                   IconButton(
//                                       onPressed: () {
//                                         // _shareLocalImage();
//                                       },
//                                       icon: Icon(Icons.share)),
//                                   Text('Share'),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   IconButton(
//                                       onPressed: () {
//                                         Fluttertoast.showToast(
//                                           msg: 'Text Copied',
//                                           toastLength: Toast.LENGTH_SHORT,
//                                           gravity: ToastGravity.BOTTOM,
//                                           timeInSecForIosWeb: 2,
//                                           backgroundColor: Colors.black54,
//                                           textColor: Colors.white,
//                                           fontSize: 16,
//                                         );
//                                         // Clipboard.setData(
//                                         //   new ClipboardData(
//                                         //       text: quotes[select]![copyIndex]
//                                         //       ['quote']
//                                         //           .toString()),
//                                         // );
//                                       },
//                                       icon: Icon(Icons.copy)),
//                                   Text('Copy'),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   IconButton(
//                                       onPressed: () {
//                                         Fluttertoast.showToast(
//                                           msg: 'Download Successfully',
//                                           toastLength: Toast.LENGTH_SHORT,
//                                           gravity: ToastGravity.BOTTOM,
//                                           timeInSecForIosWeb: 2,
//                                           backgroundColor: Colors.black54,
//                                           textColor: Colors.white,
//                                           fontSize: 16,
//                                         );
//                                         // _saveLocalImage();
//                                       },
//                                       icon: Icon(Icons.download_rounded)),
//                                   Text('Download'),
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   IconButton(
//                                       onPressed: () async {
//                                         Fluttertoast.showToast(
//                                           msg: 'Wallpaper Set Successfully',
//                                           toastLength: Toast.LENGTH_SHORT,
//                                           gravity: ToastGravity.BOTTOM,
//                                           timeInSecForIosWeb: 2,
//                                           backgroundColor: Colors.black54,
//                                           textColor: Colors.white,
//                                           fontSize: 16,
//                                         );
//                                         RenderRepaintBoundary boundary = _globalKey.currentContext!
//                                             .findRenderObject() as RenderRepaintBoundary;
//                                         ui.Image imageUi = await boundary.toImage();
//                                         ByteData? byteData =
//                                         await imageUi.toByteData(format: ui.ImageByteFormat.png);
//                                         Uint8List img = byteData!.buffer.asUint8List();
//                                         final path = await getApplicationCacheDirectory();
//                                         File file = File("${path.path}/img.png");
//                                         file.writeAsBytes(img);
//                                         int location= WallpaperManager.HOME_SCREEN;
//                                         bool result=await WallpaperManager.clearWallpaper();
//                                         result=await WallpaperManager.setWallpaperFromFile(file.path, location);
//                                       },
//                                       icon: Icon(Icons.wallpaper_rounded)),
//                                   Text('Wallpaper'),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )),
//                   );
//                 },
//               );
//             },
//             child: Container(
//                 height: 55,
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 margin: EdgeInsets.only(top: 350, left: 95),
//                 decoration: BoxDecoration(
//                     color: Colors.black38,
//                     borderRadius: BorderRadius.circular(15)),
//                 alignment: Alignment.center,
//                 child: Icon(
//                   Icons.tune_rounded,
//                   color: Colors.white,
//                 )),
//           ),
//           SpeedDialFabWidget(
//             secondaryIconsList: [
//               Icons.wallpaper_rounded,
//               Icons.share_rounded,
//               Icons.content_paste,
//               Icons.save,
//               Icons.edit,
//             ],
//             secondaryIconsText: [
//               "Themes",
//               "Share",
//               "Copy",
//               "Save",
//               "Edit",
//             ],
//             secondaryIconsOnPress: [
//                   () => {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => ChoiceTheme(),
//                 ))
//               },
//                   () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => RamdomQuotes(),))},
//                   () => {
//                 Fluttertoast.showToast(
//                   msg: 'Text Copied',
//                   toastLength: Toast.LENGTH_SHORT,
//                   gravity: ToastGravity.BOTTOM,
//                   timeInSecForIosWeb: 2,
//                   backgroundColor: Colors.black54,
//                   textColor: Colors.white,
//                   fontSize: 16,
//                 ),
//                 // Clipboard.setData(
//                 //   new ClipboardData(
//                 //       text: quotes[select]![copyIndex]['quote'].toString()),
//                 // ),
//               },
//                   () => {Fluttertoast.showToast(
//                 msg: 'Image Saved',
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.BOTTOM,
//                 timeInSecForIosWeb: 2,
//                 backgroundColor: Colors.black54,
//                 textColor: Colors.white,
//                 fontSize: 16,
//               ),
//                 // _saveLocalImage()
//                   },
//                   () => {
//                 // Navigator.of(context).push(MaterialPageRoute(
//                 //   builder: (context) => EditPage(),
//                 // ))
//               },
//             ],
//             secondaryBackgroundColor: Colors.black38,
//             secondaryForegroundColor: Colors.grey.shade200,
//             primaryBackgroundColor: Colors.black38,
//             primaryForegroundColor: Colors.grey.shade100,
//           ),
//         ],
//       ),
//
//     );
//   }
//
//   void getImagesFromUnsplash()async{
//     var url = 'https://api.unsplash.com/search/photos?per_page=30&query=nature&order_by=relevant&client_id=BEI2ELJXRcv2lBZO6D7C_wmaJtgSLqXD6k39aC79C1k';
//     var uri = Uri.parse(url);
//     var response = await http.get(uri);
//     print(response.statusCode);
//     var unsplashData = json.decode(response.body);
//     imageList = unsplashData['results'];
//     setState(() {
//
//     });
//   }
// }
//

//
//
// GlobalKey _globalKey = GlobalKey();
