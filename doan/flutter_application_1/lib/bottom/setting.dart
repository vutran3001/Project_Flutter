// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Cài đặt',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
