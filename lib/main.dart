import 'package:flutter/material.dart';
import 'package:moosic/main/constants.dart';
import 'package:moosic/main/main.dart';
// import 'main/get_started.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moosic',
      home: Main(),
      // home: GetStarted(),
      theme: ThemeData(
        primaryColor: mainColor,
        accentColor: Colors.purple,
      ),
    ),
  );
}
