import 'package:flutter/material.dart';
import 'package:gdg_prod/list/teams_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(App());
}

bool iosPlatform(BuildContext context){
  return Theme.of(context).platform == TargetPlatform.iOS;
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Times da Copa 2018",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: iosPlatform(context) ? Colors.yellow : Colors.green,
        brightness: Brightness.dark
      ),
      home: TeamsPage(),
    );
  }
}