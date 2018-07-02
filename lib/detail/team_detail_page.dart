import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdg_prod/model/team.dart';

class TeamDetailPage extends StatelessWidget {

  final Team team;

  TeamDetailPage(this.team);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.name),
      ),
      body: Container(
        child: Center(
          child: new Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                teamImage,
                Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),),
                Text(team.name),
                Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),),
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text("Número de títulos: ${team.numberOfTitles.toString()}")
                  ],
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),),
                Text(team.description),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

            ),
          ),
        ),
      ),
    );
  }

  Widget get teamImage {
    return Hero(
      tag: team.reference,
      child: Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(team.imageUrl),
            fit: BoxFit.scaleDown
          )
        ),
      ),
    );
  }
}