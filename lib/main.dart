import 'package:flutter/material.dart';
import 'Screens/Categories/Categories_Page.dart';

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
      home: CategoriesPage(),
    );
  }
}


