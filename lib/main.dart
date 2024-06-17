import 'package:flutter/material.dart';
import 'Screens/SplashScreen/Splash_Screen.dart';

void main()
{
  runApp(QutoesApp());
}
class QutoesApp extends StatefulWidget {
  const QutoesApp({super.key});

  @override
  State<QutoesApp> createState() => _QutoesAppState();
}

class _QutoesAppState extends State<QutoesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


