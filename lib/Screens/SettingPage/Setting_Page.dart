import 'package:flutter/material.dart';

import '../../Utils/global.dart';
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Theme Mode'),
            trailing:   Switch(onChanged: (value) {
              setState(() {
                isDark=!isDark;
              });
            }, value: isDark ,),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Show Author'),
            trailing:   Switch(onChanged: (value) {
              setState(() {
                setState(() {
                  isAuthor=!isAuthor;
                });
              });
            }, value: isAuthor ,),
          ),
          ListTile(
            leading: Icon(Icons.category_rounded),
            title: Text('Show Recent Category'),
            trailing:   Switch(onChanged: (value) {
              setState(() {
                setState(() {
                  isCategory=!isCategory;
                });
              });
            }, value: isCategory ,),
          ),
        ],
      ),
    );
  }
}
