import 'package:flutter/material.dart';
import 'package:gdg_prod/list/teams_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Times da Copa 2018",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: TeamsPage(),
    );
  }
}